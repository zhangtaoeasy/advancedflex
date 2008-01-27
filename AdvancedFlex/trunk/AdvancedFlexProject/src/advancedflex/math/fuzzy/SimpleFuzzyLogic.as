package advancedflex.math.fuzzy
{
	public class SimpleFuzzyLogic implements IFuzzyLogic
	{
		public final function notVery(a:Number):Number
		{
			return Math.sqrt(a);
		}
		
		public final function very(a:Number):Number
		{
			return a * a;
		}
		
		public final function not(a:Number):Number
		{
			return 1 - a;
		}
		
		public final function nor(a:Number, b:Number):Number
		{
			return 1 - Math.max(a, b);
		}
		
		public final function or(a:Number, b:Number):Number
		{
			return Math.max(a, b);
		}
		
		public final function and(a:Number, b:Number):Number
		{
			return Math.min(a, b);
		}
		
		public final function xor(a:Number, b:Number):Number
		{
			return Math.max(a, b) - Math.min(a, b);
		}
		
		public final function nand(a:Number, b:Number):Number
		{
			return 1 - Math.min(a, b);
		}
		private static var _instance:IFuzzyLogic = new SimpleFuzzyLogic();
		public static function get instance():IFuzzyLogic
		{
			return _instance;
		}
		
	}
}