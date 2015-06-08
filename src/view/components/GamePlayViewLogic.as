package view.components
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	import com.greensock.plugins.OnCompleteRenderPlugin;
	
	import config.GeneralNotification;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.drm.VoucherAccessInfo;
	import flash.utils.Endian;
	import flash.utils.Timer;
	import flash.utils.setTimeout;
	
	import model.dto.EnemieDto;
	
	import utils.EventTrans;
	import utils.WareHouse;
	
	public class GamePlayViewLogic extends ViewLogic //логика графики, как аппендицит медиатора, создает, подгружает графику
													//вешает лисенеры, в этой игре делает большуя часть работы.
													// передает эвент в старт медиатор
	{	
		public var cells:Vector.<MovieClip>;
		public var target:TargetVievLogic;
		public var redBtn:BonusViewLigic;
		public var bonusLable:BonusViewLigic;
		public var incomingDto:EnemieDto;
		public var returnBtn:SimpleButton;
		
		public function GamePlayViewLogic()
		{
			super(WareHouse.getInstance().getAsset('www_1') as MovieClip);
			initAllCellsAndTarget();
		}
		private function initAllCellsAndTarget():void{
			
			cells = new Vector.<MovieClip>;
			var counter:int = 0;
			while (content.hasOwnProperty('circle_'+counter)){
				cells.push(content['circle_'+counter]);
				counter++;
			}
			initBtns();
		}
		public function addTargetToRandomCell(incomingDto:EnemieDto):void
		{	
			target = new TargetVievLogic(incomingDto);
			if (target.currentTarget.parent == null){
			cells[incomingDto.cellID].addChild(target.currentTarget);
			target.addEventListener(GeneralNotification.PUSH_ON_ENEMIE , onClickOnTarget);
			
			}
		}
		public function onClickOnTarget(a:EventTrans):void
			{
				dispatchEvent(new EventTrans(GeneralNotification.ON_CLICK_ON_TARGET, a.data));
			}
		private function get gameContent():Sprite{
				return content as Sprite;
			}	
		public function initBtns():void
			{
			returnBtn = gameContent["ret_Btn"];
			returnBtn.addEventListener(MouseEvent.CLICK, onClickReturnBtn);
			}
		public function onClickReturnBtn(event:MouseEvent):void
			{
			dispatchEvent(new Event(GeneralNotification.RETURN_COMMAND)); 
			}
		
		public function removeEnemie(incomingDto:EnemieDto):void
		{
			if (incomingDto.visualEnemie.parent != null){
				incomingDto.visualEnemie.addFrameScript(incomingDto.visualEnemie.totalFrames-1, lastFrameScript);
		}
		
		function lastFrameScript():void
		{
		incomingDto.visualEnemie.stop();
		incomingDto.visualEnemie.parent.removeChild(incomingDto.visualEnemie);
		incomingDto.resetTimer();
		dispatchEvent(new EventTrans(GeneralNotification.RESET_SCORE_AND_TIMER, incomingDto.enemieiID));
	}

	incomingDto.visualEnemie.gotoAndPlay(2);
}
	
		
		public function removeEnemieByTimer(incomingRemDto:MovieClip):void
		{	
			if (incomingRemDto.parent != null){
				
			TweenLite.to(incomingRemDto, 1 , {x:incomingRemDto.x, y:-330, ease:Cubic.easeIn, onComplete:removeFunction});
			function removeFunction():void{
			incomingRemDto.parent.removeChild(incomingRemDto);
			}	
			}
		}
		public function addBonusSeconds():void
		{
			redBtn = new BonusViewLigic();
			content.addChild(redBtn.bonusSeconds);
			redBtn.bonusSeconds.x = 330;
			redBtn.bonusSeconds.y = 100;
		}
		public function addRedBtn():void
		{
			redBtn = new BonusViewLigic();
			content.addChild(redBtn.redBtn);
			redBtn.redBtn.x = 320;
			redBtn.redBtn.y = 220;
			redBtn.redBtn.addEventListener(MouseEvent.CLICK, onClickOnRedBtn);
		}
		public function onClickOnRedBtn(e:MouseEvent):void
		{
			var ellow:int = 2;
			var green:int = 3;
			dispatchEvent(new EventTrans(GeneralNotification.ON_CLICK_ON_RED_BTN, green));
			dispatchEvent(new EventTrans(GeneralNotification.ON_CLICK_ON_RED_BTN, ellow));
		}
		public function addbonusLable():void
		{
			bonusLable = new BonusViewLigic();
			content.addChild(bonusLable.lableRedBtn);
			bonusLable.lableRedBtn.x = 415;
			bonusLable.lableRedBtn.y = 60;
			bonusLable.lableRedBtn.addEventListener(MouseEvent.CLICK, onClickOnLable);
		}
		public function remBonusLable():void
		{
			if (bonusLable.lableRedBtn.parent !== null){
			content.removeChild(bonusLable.lableRedBtn);
			bonusLable.lableRedBtn.removeEventListener(MouseEvent.CLICK, onClickOnLable);
			}
		}
		public function onClickOnLable(e:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralNotification.ON_CLICK_ON_LABLE));
		}
		public function remCurentBonus():void
		{
			content.removeChild(redBtn.redBtn);
			redBtn.redBtn.removeEventListener(MouseEvent.CLICK, onClickOnRedBtn);
		}
	}
}		
//		target.addEventListener("clickOnTarget", delEnemie);
//		
//		public function delEnemie(e:Event):void{
//			target.killEnemie();
//		}
//	
//			newTarget.addEventListener("udalitVraga", onRemove);
//			function onRemove(event:EventTrans):void{
//				var removableEnemi:DisplayObject = event.data as DisplayObject;
//				cells[neededCell1].removeChild(removableEnemi);
//			}
			
		
		
			 
		
		
//		private function onClickOnTarget(event:MouseEvent):void{
//			target.parent.removeChild(target);
//			dispatchEvent(new EventTrans(GeneralNotification.SEPAR_DEAD, target )); 
//		}
//		public function randomRange(minNum:Number, maxNum:Number):Number{
//			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
//		}
//		
//		private function newEnemieTimer():void{
//			timer = new Timer(10000);
//			timer.addEventListener(TimerEvent.TIMER, createNewEnemie);
//			//timer.start();
//		function createNewEnemie (event:TimerEvent):void{
//			var n:int = Math.floor(Math.random()*11);
//			if (n>6){
//				dispatchEvent(new EventTrans("sozdatBoss", target));
//			}
//			else {
//				//dispatchEvent(new EventTrans("sozdatComrad"));
//			}
//		}
//		}
//	
	

