package view.mediator
{
	import config.GeneralNotification;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.components.ViewLogic;
	
	public class UIMediator extends Mediator
	{
		public function UIMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		override public function onRegister():void{
			sendNotification(GeneralNotification.ADD_CHILD_TO_ROOT, viewLogic.content);
			super.onRegister();
		}
		override public function onRemove():void{
			sendNotification(GeneralNotification.REMOVE_CHILD_FROM_FOOT, viewLogic.content);
			super.onRemove();
		}
		protected function get viewLogic():ViewLogic{
			return viewComponent as ViewLogic;
		}
	
	}
}