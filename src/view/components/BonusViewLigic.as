package view.components
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.EventDispatcher;
	
	import utils.WareHouse;
	
	public class BonusViewLigic extends EventDispatcher
	{
		public var redBtn:DisplayObject;
		public var lableRedBtn:MovieClip;
		public var lableTimerBonus:MovieClip;
		public var bonusSeconds:MovieClip;
	
		public function BonusViewLigic()
		{
			super();
			redBtn = WareHouse.getInstance().getAsset("RedBtn_1") as SimpleButton;
			lableTimerBonus = WareHouse.getInstance().getAsset("timerBonus_1") as MovieClip;
			lableRedBtn = WareHouse.getInstance().getAsset("bonusLable_1") as MovieClip; 
			bonusSeconds = WareHouse.getInstance().getAsset("sec_1") as MovieClip; 
		}
	}
}