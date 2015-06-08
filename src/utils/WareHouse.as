package utils
{
	import flash.display.InteractiveObject;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;

	public class WareHouse
	{
		static private var instance:WareHouse;
		
		private var loaderInfo:LoaderInfo;
					
		static public function getInstance():WareHouse{
			
			if (instance == null){
				instance = new WareHouse();
	}
		
					return instance;
	}
		
		public function setData(loaderInfo:LoaderInfo):void {
			this.loaderInfo = loaderInfo;
	} 
			public function getAsset(name:String):InteractiveObject {
				
				if (loaderInfo.applicationDomain.hasDefinition(name)){
				var AssetClass:Class = loaderInfo.applicationDomain.getDefinition(name) as Class;
				
				var mc:InteractiveObject = new AssetClass();
				
				return mc;
				}
				return null;
				
			}
			
		
		
		
		}
			
			
		
		}
	
