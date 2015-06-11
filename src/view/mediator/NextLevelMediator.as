package view.mediator
{
	import view.components.NextLevelViewLogic;

	public class NextLevelMediator extends UIMediator
	{
		public static const NAME:String = "NextLevelMediator";
		
		public function NextLevelMediator()
		{
			super(NAME, new NextLevelViewLogic());
			
		}
		public function get nextLevelVL():NextLevelViewLogic{
			return viewComponent as NextLevelViewLogic;
		}
	}
}