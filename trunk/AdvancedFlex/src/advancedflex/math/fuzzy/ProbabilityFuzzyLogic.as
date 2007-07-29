package advancedflex.math.fuzzy
{
	public class ProbabilityFuzzyLogic implements IFuzzyLogic
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
			return 1 - a - b + a*b;
		}
		
		public final function or(a:Number, b:Number):Number
		{
			return a + b - a*b;
		}
		
		public final function and(a:Number, b:Number):Number
		{
			return a * b;
		}
		
		public final function xor(a:Number, b:Number):Number
		{
			return a + b - 2*a*b;
		}
		
		public final function nand(a:Number, b:Number):Number
		{
			return 1 - a*b;
		}
		private static const _instance:IFuzzyLogic = new ProbabilityFuzzyLogic()
		public static function get instance():IFuzzyLogic
		{
			return _instance;
		}
		
	}
}