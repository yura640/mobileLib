package view.components
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import utils.WareHouse;
	
	public class NextLevelViewLogic extends ViewLogic
	{
		public var nextLevelBtn:SimpleButton;
		public function NextLevelViewLogic()
		{
			super(WareHouse.getInstance().getAsset('nextLevel_BG') as MovieClip);
			initBtns();
		}
		public function initBtns():void{
			
			nextLevelBtn = content["nextLevel_Btn"];
			nextLevelBtn.addEventListener(MouseEvent.CLICK, onClicOnBtn);
		}
		public function onClicOnBtn(event:MouseEvent):void{
			dispatchEvent(new Event(GeneralNotification.LOAD_NEXT_LEVEL));
			trace ("LOAD_NEXT_LEVEL");
		}
	}
}