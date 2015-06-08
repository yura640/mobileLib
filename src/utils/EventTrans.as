package utils
{
	import flash.events.Event;
	
	public class EventTrans extends Event
	{
		public var data:Object;
		public function EventTrans(type:String, additionalData:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data = additionalData;
		}
	}
}