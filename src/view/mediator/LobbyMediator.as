package view.mediator
{
	import config.GeneralNotification;
	
	import flash.events.Event;
	
	import utils.EventTrans;
	
	import view.components.LobbyViewLogic;

	public class LobbyMediator extends UIMediator
	{
		public static const NAME:String = "LobbyMediator";
		
		public function LobbyMediator()
		{
			super(NAME, new LobbyViewLogic());
			viewComponent.addEventListener(GeneralNotification.START_BTN_CLICKED, btnClicked);
			viewComponent.addEventListener(GeneralNotification.ADD_NAME, addName);
			viewComponent.addEventListener(GeneralNotification.CLICK_ON_HIGH_SCORE_BTN, onClickOnHighScoreBtn);
		}
		public function addName (e:EventTrans):void
		{
			//sendNotification(GeneralNotification.ADD_NAME_COMMAND, e.data);
		}
		public function btnClicked(event:EventTrans):void{
			sendNotification(GeneralNotification.START_THE_GAME, event.data);
			sendNotification("SLC", 1);
		}
		public function onClickOnHighScoreBtn (e:Event):void
		{
			sendNotification(GeneralNotification.ON_CLICK_ON_HIGH_SCORE_BTN);
			
		}
	}
}