package controller.comands
{
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class AddNameCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var name:String = notification.getBody() as String;
			(facade.retrieveProxy(UserProxy.NAME) as UserProxy).addUserName(name);
		}
	}
}