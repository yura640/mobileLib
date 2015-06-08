package controller.comands
{
	import config.GeneralNotification;
	
	import model.dto.EnemieDto;
	import model.proxy.EnemieProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class AddEnemieToCellComand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var dto:EnemieDto = notification.getBody() as EnemieDto;
			
			if (dto.enemieiID==1){
				dto.setupTimer(2000); // red
			}
			if (dto.enemieiID==2){
				dto.setupTimer(2500); // ellow
			}
			if (dto.enemieiID==3){
				dto.setupTimer(1000);  //zel
			} 
			
			(facade.retrieveProxy(EnemieProxy.NAME) as EnemieProxy).addDtoToArray(dto);
			
			sendNotification(GeneralNotification.PUSH_ENEMI_ON_CELL, dto);
			
		}
		}
	}
