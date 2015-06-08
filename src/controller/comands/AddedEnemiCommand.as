package controller.comands
{
	import config.GeneralNotification;
	
	import model.dto.EnemieDto;
	import model.dto.GamesConfigDO;
	import model.dto.LevelDto;
	import model.proxy.EnemieProxy;
	import model.proxy.GamesConfigProxy;
	import model.proxy.LevelProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class AddedEnemiCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			var checkingEnemie:LevelDto;
			var neededCell:int = Math.floor(Math.random()*10);
			var neededSepar:int = (Math.floor(Math.random()*3)+1);
			checkingEnemie = (facade.retrieveProxy(LevelProxy.NAME) as LevelProxy).levelDto;
			if (neededSepar == checkingEnemie.typeOfEnemie){
			var  enemieDto:EnemieDto = new EnemieDto();
			enemieDto.visualEnemie = null;
			enemieDto.enemieiID = neededSepar;
			enemieDto.cellID = neededCell;
			
			// (facade.retrieveProxy(EnemieProxy.NAME) as EnemieProxy).addDtoToArray(enemieDto);
			 (facade.retrieveProxy(EnemieProxy.NAME) as EnemieProxy).proverkaNaCell(enemieDto);
			} else 
				sendNotification(GeneralNotification.GENERATE_ENEMI_AND_CELL);
			
			
			
		}
	}
}