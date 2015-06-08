package controller.comands
{
	import config.GeneralNotification;
	
	import flashx.textLayout.tlf_internal;
	
	import model.dto.EnemieDto;
	import model.proxy.BonusProxy;
	import model.proxy.EnemieProxy;
	import model.proxy.GameProxy;
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.GameOverMediator;
	import view.mediator.GamePlayMediator;
	import view.mediator.ScoreMediator;
	
	public class ReloadCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{	
			facade.removeMediator(GameOverMediator.NAME);
			facade.removeMediator(GamePlayMediator.NAME);
			facade.removeMediator(ScoreMediator.NAME);
			sendNotification(GeneralNotification.GAME_IS_LOADED);
			
			(facade.retrieveProxy(GameProxy.NAME) as GameProxy).timerStop();
			(facade.retrieveProxy(BonusProxy.NAME) as BonusProxy).timerBonusLable.stop();
			//(facade.retrieveProxy(BonusProxy.NAME) as BonusProxy).resetLableTimer();
		}
	}
}