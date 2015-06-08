package view.components
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	import model.dto.UserDto;
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.observer.Notification;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import utils.WareHouse;
	
	public class ScoreViewLogic extends ViewLogic
	{	
		
		
		public function ScoreViewLogic()
		{
			super(WareHouse.getInstance().getAsset('panel_1') as MovieClip);
		}
		public function upScore(rezultat:int):void
		{
			(content["score"] as TextField).text = "SCORE : " +  rezultat ; 
		}
		
		public function upTimer(timer:int):void{
			
			(content["gameTimer"] as TextField).text = " TIME : "+" " + timer; 
	}
}
}