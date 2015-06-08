package model.proxy
{
	import config.GeneralNotification;
	
	import controller.comands.AddedEnemiCommand;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import model.dto.EnemieDto;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import utils.EventTrans;
	
	public class EnemieProxy extends Proxy
	{
		public static const NAME:String = "EnemieProxy";
		
		public var arrayOfEnemy:Array= new Array;
		
		public function EnemieProxy()
		{
			super(NAME);	
		}
		
		public function addDtoToArray(incomingDto:EnemieDto):void
		{
			arrayOfEnemy.push(incomingDto);
			incomingDto.addEventListener("dellCurentEnemie", dellEnemie);	
			
		}
		public function proverkaNaCell(enemieDto:EnemieDto):void {
			for (var i:int = 0; i < arrayOfEnemy.length; i++) {
				var oneDto:EnemieDto = arrayOfEnemy[i];
				if (oneDto.cellID == enemieDto.cellID) {
					sendNotification(GeneralNotification.GENERATE_ENEMI_AND_CELL);
					trace("ошибка");
					return;
				}
			}
			sendNotification("dobavitVraga1", enemieDto);
			trace(enemieDto.enemieiID, enemieDto.cellID);
			
		}
				
		
		
		
		public function dellEnemie(e:EventTrans):void
		{
			sendNotification(GeneralNotification.REMOVE_ENEMIE_BY_TIMER, e.data);
			removeEnemie(e.data as MovieClip);
		}
		
		public function removeEnemie (enemie:MovieClip):void
		{
			for (var i:int = 0; i<arrayOfEnemy.length; i++){	
				var oneDto:EnemieDto = arrayOfEnemy[i]; 
				if (oneDto.visualEnemie == enemie){
					sendNotification(GeneralNotification.REMOVE_ENEMIE, oneDto);
					arrayOfEnemy.splice(arrayOfEnemy.indexOf(oneDto), 1);
				
				}
			}		
		}
		public function removeEnemeByBtn(number:int):void
		{
			for (var i:int = 0; i<arrayOfEnemy.length; i++){
				var oneDto:EnemieDto = arrayOfEnemy[i];
				if (oneDto.enemieiID == number){
					sendNotification(GeneralNotification.REMOVE_ENEMIE, oneDto);
					arrayOfEnemy.splice(arrayOfEnemy.indexOf(oneDto), 1);
				}
			}
		}
		
	}
	
}