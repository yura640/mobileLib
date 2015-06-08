package view.mediator
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class RootMediator extends Mediator //главный медиатор, визульный компонент которого - гл. Спрайт
	{											// настроен на адд и ремув, и выполняет соответствующие действия при
												// входящих нотифах
		public static const NAME:String = "RootMediator";
		
		public function RootMediator(rootSprite:Sprite)
		{
			super(NAME, rootSprite);
		}
		override public function listNotificationInterests():Array{
			return [GeneralNotification.ADD_CHILD_TO_ROOT, GeneralNotification.REMOVE_CHILD_FROM_FOOT];
		}
		override public function handleNotification(notification:INotification):void{
			
			var displayobject:DisplayObject = notification.getBody() as DisplayObject;
			
			switch(notification.getName()){
				case GeneralNotification.ADD_CHILD_TO_ROOT:
					(viewComponent as Sprite).addChild(displayobject);
					break;
				case GeneralNotification.REMOVE_CHILD_FROM_FOOT:
					(viewComponent as Sprite).removeChild(displayobject);
					break;
			}
		}
	}
	
}