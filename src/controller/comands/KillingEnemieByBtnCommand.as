package controller.comands
{
	import model.proxy.EnemieProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class KillingEnemieByBtnCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var numberEnemie:int = notification.getBody() as int;
			(facade.retrieveProxy(EnemieProxy.NAME) as EnemieProxy).removeEnemeByBtn(numberEnemie);
		}
	}
}