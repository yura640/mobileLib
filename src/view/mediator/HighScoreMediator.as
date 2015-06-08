package view.mediator
{
	import config.GeneralNotification;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.INotification;
	
	import view.components.HighScoreVL;

	public class HighScoreMediator extends UIMediator
	{
		public static const NAME:String = "HighScoreMediator"; 
		
		public function HighScoreMediator()
		{
			super(NAME, new HighScoreVL());
			highScoreVL.addEventListener(GeneralNotification.ON_CLICK_ON_RETURN_BTN, clickOnReturnBtnFunction);
		}
		private function get highScoreVL():HighScoreVL {
			return viewComponent as HighScoreVL;
		}
		override public function listNotificationInterests():Array{
			return [GeneralNotification.MY_HIGH_SCORE_DTO];
		}
		override public function handleNotification(notification:INotification):void{
			
			switch(notification.getName()){
				case GeneralNotification.MY_HIGH_SCORE_DTO:
					var arr:Array = notification.getBody() as Array;
					highScoreVL.addResultsOnScoreBord(arr);
				break;
			}
		}
		public function clickOnReturnBtnFunction(e:Event):void
		{
			sendNotification(GeneralNotification.CLICK_RETURN_BTN);
		}
	}
}