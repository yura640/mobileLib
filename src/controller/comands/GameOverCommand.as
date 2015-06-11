package controller.comands
{
	import config.GeneralNotification;
	
	import model.dto.LevelDto;
	import model.proxy.BonusProxy;
	import model.proxy.GameProxy;
	import model.proxy.LevelProxy;
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.GameOverMediator;
	import view.mediator.GamePlayMediator;
	import view.mediator.NextLevelMediator;
	
	public class GameOverCommand extends SimpleCommand
	{	
		override public function execute(notification:INotification):void
		{
			var gameConfig:LevelDto = (facade.retrieveProxy(LevelProxy.NAME) as LevelProxy).levelDto;
			var score:int = (facade.retrieveProxy(UserProxy.NAME) as UserProxy).user.score;
			(facade.retrieveProxy(GameProxy.NAME) as GameProxy).timer.stop();
			(facade.retrieveProxy(BonusProxy.NAME) as BonusProxy).timerBonusLable.stop();
			facade.removeMediator(GamePlayMediator.NAME);
			if (score<gameConfig.scoresToNextLevel){
				facade.registerMediator(new GameOverMediator(score));
			}else
				facade.registerMediator(new NextLevelMediator());
				trace("you win");
		}
	}
}