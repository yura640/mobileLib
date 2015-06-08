package
{
	import config.GeneralNotification;
	
	import controller.comands.BootComand;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	import utils.WareHouse;
	
	

	[SWF(width = '600', height = '480', frameRate = '24', backgroundColor = 'fffaaavv')]
	
	public class pureMVCTest
	{ 
		private static var _instance:pureMVCTest;
		
		public static function getInstance():pureMVCTest{
			if (_instance==null){
				_instance = new pureMVCTest();
			}
			return _instance;
		}
		
		
		public function startApp(sprite:Sprite):void
		{
			Facade.getInstance().registerCommand(GeneralNotification.START, BootComand);
			Facade.getInstance().sendNotification(GeneralNotification.START, sprite);
		}
	}	
}