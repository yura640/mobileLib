package view.mediator
{
	import config.GeneralNotification;
	
	import flash.events.Event;
	
	import view.components.NextLevelViewLogic;

	public class NextLevelMediator extends UIMediator
	{
		public static const NAME:String = "NextLevelMediator";
		
		public function NextLevelMediator()
		{
			super(NAME, new NextLevelViewLogic());
			nextLevelVL.addEventListener(GeneralNotification.LOAD_NEXT_LEVEL, onLoadLevel);
		}
		public function onLoadLevel(e:Event):void{
			sendNotification(GeneralNotification.LOAD_NEXT_LEVEL_COMMAND);
		}
		public function get nextLevelVL():NextLevelViewLogic{
			return viewComponent as NextLevelViewLogic;
		}
	}
}