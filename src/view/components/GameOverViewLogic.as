package view.components
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import utils.WareHouse;
	
	public class GameOverViewLogic extends ViewLogic
	{
		public var gameOverScore:TextField;
		public var returnBtn:SimpleButton;
	
		public function GameOverViewLogic(rez:int)
		{
			super(WareHouse.getInstance().getAsset('gameOver_BG') as MovieClip);
			
			(content["gameOver_score"] as TextField).text = " " + rez + " !"; 
			
			initBtns();
		}
		private function get gameOverContent():Sprite{
			return content as Sprite;
		}	
		
		public function initBtns():void
		{
			gameOverScore = gameOverContent["gameOver_score"];
			returnBtn = gameOverContent ["return_BTN"];
			returnBtn.addEventListener(MouseEvent.CLICK, onClickReturnBtn);
		}
		
		public function onClickReturnBtn(event:MouseEvent):void{
			dispatchEvent(new Event(GeneralNotification.RETURN_COMMAND)); 
		}
		
		}
	}
	
