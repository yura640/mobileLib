package controller.comands
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.net.sendToURL;
	
	import model.proxy.EnemieProxy;
	import model.proxy.GameProxy;
	import model.proxy.UserProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.components.TargetVievLogic;
	import view.mediator.GamePlayMediator;
	
	public class KillingEnemieCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var enemi:MovieClip = notification.getBody() as MovieClip;
				
			(facade.retrieveProxy(EnemieProxy.NAME) as EnemieProxy).removeEnemie(enemi);
			}
		}
	}


	