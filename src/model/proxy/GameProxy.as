package model.proxy
{
	import config.GeneralNotification;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import flash.utils.setTimeout;
	
	import model.dto.GameDTO;
	
	import org.osmf.events.TimeEvent;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import utils.WareHouse;
	
	public class GameProxy extends Proxy
	{
		public var removeEnemietimer:Timer;
		public var timer:Timer;
		public var gameTimer:Timer;
		public static const NAME:String = "GameProxy";
		public var dif:int;
		
		public function GameProxy(proxyName:String=null, data:Object=null)
		{
			super(NAME, new GameDTO());
		}
		
		public function get game():GameDTO{ 
			return getData() as GameDTO;
		}
		
		public function startGame():void
		{
			timer = new Timer(700);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			startGameTimer(15);
		}
		public function timerStop():void
		{
			timer.stop();
			gameTimer.stop();
		}
		
		private function onTimer(event:TimerEvent):void
		{
			sendNotification(GeneralNotification.GENERATE_ENEMI_AND_CELL);
		}
		
		public function startGameTimer(dif:int):void
		{
			gameTimer = new Timer(1000,dif);
			gameTimer.start();
			gameTimer.addEventListener(TimerEvent.TIMER, oneSecond);	
		}
		
		public function oneSecond(event:TimerEvent):void
			{	
				dif = gameTimer.repeatCount - gameTimer.currentCount;
				sendNotification(GeneralNotification.VIZUAL_TIMER,dif);
				if (dif == 0){
				sendNotification(GeneralNotification.GAME_OVER_COMMAND);	
				}	
			}
			
		public function resetGameTimer():void
			{
				gameTimer.stop();
				gameTimer.repeatCount = dif + 10;
				startGameTimer(gameTimer.repeatCount);
			}
		
		public function removeEnemie():void
		{
			removeEnemietimer = new Timer(800,1);
			removeEnemietimer.addEventListener(TimerEvent.TIMER, timerDown);
			removeEnemietimer.start(); 
		}
		
		public function timerDown(event:TimerEvent):void
		{
			sendNotification(GeneralNotification.REMOVE_ENEMIE_BY_TIMER);
		}
		
		public function timerReset():void{
			removeEnemietimer.reset();
		}
	}
}
