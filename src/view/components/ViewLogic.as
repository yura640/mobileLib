package view.components
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class ViewLogic extends EventDispatcher //обертка для графики, не позволяющая менять контент
	{	
		protected var displayObject:DisplayObjectContainer;
		
		public function ViewLogic(displayObject:DisplayObjectContainer){
			
			this.displayObject = displayObject;
		}
		public function get content():DisplayObjectContainer{
			return displayObject;
		}

	
		}
	}
