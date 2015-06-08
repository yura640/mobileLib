package view.mediator
{
	import config.GeneralNotification;
	
	import flash.events.Event;
	
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	
	import view.components.GameOverViewLogic;

	public class GameOverMediator extends UIMediator
	{
		public static const NAME:String = "GameOverMediator";
		 
		public function GameOverMediator(score:int)
		{
			super(NAME, new GameOverViewLogic(score));
			gameOverViewLogic.addEventListener(GeneralNotification.RETURN_COMMAND, toMakeReloadCommand);
		}
		private function get gameOverViewLogic():GameOverViewLogic{
			return viewComponent as GameOverViewLogic;
		}
		public function toMakeReloadCommand(e:Event):void
		{
			sendNotification(GeneralNotification.TO_MAKE_RELOAD_COMMAND); 
		}

	}
}