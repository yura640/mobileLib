package model.proxy
{
	import config.GeneralNotification;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class BonusProxy extends Proxy
	{
		public var timerBonusLable:Timer;
		public var lableTimer:Timer;
		public var timerDellBonusLable:Timer;
		
		public static const NAME:String = "BonusProxy";
		public function BonusProxy()
		{
			super(NAME);
		}
		public function addBonusLable():void{
			timerBonusLable = new Timer(10000);
			timerBonusLable.addEventListener(TimerEvent.TIMER, onTimer);
			timerBonusLable.start();
		}
		
		private function onTimer(event:TimerEvent):void{
			sendNotification(GeneralNotification.ADD_BONUS_LABLE);
		}
		
		public function removeBonusLable():void
		{
			lableTimer = new Timer(3000,1);
			lableTimer.addEventListener(TimerEvent.TIMER, timerOff);
			lableTimer.start();
		}
		
		private function timerOff(e:TimerEvent):void
		{
		lableTimer.removeEventListener(TimerEvent.TIMER, timerOff);
			sendNotification(GeneralNotification.DELL_BONUS_LABLE);
		}
		
//		public function resetLableTimer():void
//		{
//			if(lableTimer.running){
//			lableTimer.stop();
//			}
//		}
		
		public function remCurentBonus():void
		{
			timerDellBonusLable = new Timer(4000,1);
			timerDellBonusLable.addEventListener(TimerEvent.TIMER, onTimerOff);
			timerDellBonusLable.start();
		}
		public function onTimerOff(e:TimerEvent):void
		{
			sendNotification(GeneralNotification.REMOVE_CURENT_BONUS);
		}
		
		}
		}
	
	
	
