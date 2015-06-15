package view.components
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import utils.WareHouse;
	
	public class NextLevelViewLogic extends ViewLogic
	{
		public var nextLevelBtn:SimpleButton;
		public var retBtn:SimpleButton;
		public function NextLevelViewLogic()
		{
			super(WareHouse.getInstance().getAsset("nextLevel_Bg") as MovieClip);
			initBtns();
		}
		public function initBtns():void{
			
			nextLevelBtn = nextLevelContent["next_lev"] as SimpleButton;
			nextLevelBtn.addEventListener(MouseEvent.CLICK, onClicOnBtn);
			retBtn = nextLevelContent["ret"] as SimpleButton;
			retBtn.addEventListener(MouseEvent.CLICK, onClicOnReturn);
		}
		public function get nextLevelContent():Sprite{
			return content as Sprite;
		}
		public function onClicOnBtn(event:MouseEvent):void{
			dispatchEvent(new Event(GeneralNotification.LOAD_NEXT_LEVEL));
			trace ("LOAD_NEXT_LEVEL");
		}
		public function onClicOnReturn(event:MouseEvent):void{
			dispatchEvent(new Event (GeneralNotification.RETURN_TO_LOBBY));
		}
	}
}