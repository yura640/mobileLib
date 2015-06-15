package utils
{
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	
	import mx.collections.ArrayCollection;

	public class WareHouse
	{
		static private var instance:WareHouse;
		
		private var incomData:DisplayObjectContainer;
		private var _content:Array = new Array;
					
		static public function getInstance():WareHouse{
			
			if (instance == null){
				instance = new WareHouse();
	}
		
					return instance;
	}
		
		public function setData(incomData:DisplayObjectContainer):void {
			this.incomData = incomData;
			_content.push(incomData);
	} 
		
		public function getAsset(name:String):DisplayObjectContainer{
				for each (var item:DisplayObjectContainer in _content){
					if (item.loaderInfo.applicationDomain.hasDefinition(name)){
						var itemClass:Class = item.loaderInfo.applicationDomain.getDefinition(name) as Class;
						var mc:DisplayObjectContainer = new itemClass();
						return mc;
					}
						
					}
					return null;
						
					}
				
//						var item_class:Class = item.loaderInfo.applicationDomain.getDefinition(name) as Class;
//						var item_DOC:DisplayObjectContainer = new item_class() as DisplayObjectContainer;
//						return item_DOC;
//					}
//				}
//				return null;	
//			
//			public function getAsset(name:String):InteractiveObject {
//				
//				if (incomData.loaderInfo.applicationDomain.hasDefinition(name)){
//				var AssetClass:Class = incomData.loaderInfo.applicationDomain.getDefinition(name) as Class;
//				
//				var mc:InteractiveObject = new AssetClass();
//				
//				return mc;
//				}
//				return null;
//				
//			}
//			
		
		
		
		
			
			
		
		}
	
	}