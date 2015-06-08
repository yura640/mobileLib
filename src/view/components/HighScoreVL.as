package view.components
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.sampler.getInvocationCount;
	import flash.text.TextField;
	
	import model.dto.UserDto;
	
	import utils.WareHouse;
	
	public class HighScoreVL extends ViewLogic
	{
		public function HighScoreVL()
		{
			super(WareHouse.getInstance().getAsset('scoreBord_1') as MovieClip);
			initBtns();
		}
		public function addResultsOnScoreBord(scoreDto:Array):void
		{		for (var i:int = 0; i<scoreDto.length; i++){
			if ((content["scoreText_"+i] as TextField) == null){
				scoreDto.splice((content["scoreText_"+scoreDto.length] as TextField));
			} else {
				var obj:Object = scoreDto[i];
				(content["scoreText_"+i] as TextField).text = i+1 + "." + " " + "PLAYER:" + " " +  obj.name + " "+ "SCORE:" + " " + obj.score;
				trace (obj.score);
			}
			}
			}
		public function initBtns():void
		{
			var returnBtn:SimpleButton = content["returnBtn"] as SimpleButton;
			returnBtn.addEventListener(MouseEvent.CLICK, onClickOnReturnBtn);
		}
		public function onClickOnReturnBtn(e:MouseEvent):void
		{
			dispatchEvent( new Event(GeneralNotification.ON_CLICK_ON_RETURN_BTN));
		}
			}
			}
		
			 
	
