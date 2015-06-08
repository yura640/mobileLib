package controller.comands
{
	import config.GeneralNotification;
	
	import model.proxy.BonusProxy;
	import model.proxy.GameProxy;
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.GameOverMediator;
	import view.mediator.GamePlayMediator;
	
	public class GameOverCommand extends SimpleCommand
	{	
		override public function execute(notification:INotification):void
		{
			var score:int = (facade.retrieveProxy(UserProxy.NAME) as UserProxy).user.score;
			(facade.retrieveProxy(GameProxy.NAME) as GameProxy).timer.stop();
			(facade.retrieveProxy(BonusProxy.NAME) as BonusProxy).timerBonusLable.stop();
			//(facade.retrieveProxy(BonusProxy.NAME) as BonusProxy).resetdellBonusTimer();
			facade.registerMediator(new GameOverMediator(score));
			facade.removeMediator(GamePlayMediator.NAME);
			//(facade.retrieveProxy(BonusProxy.NAME) as BonusProxy).resetLableTimer();
		}
	}
}