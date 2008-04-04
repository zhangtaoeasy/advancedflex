package advancedflex.utils.overload.patterns {
	import advancedflex.utils.FloatUtil;
	
	public class NumberPattern extends NumericPattern {
		
		private var $value:Number;
		
		private var $tol:Number;
		
		public function NumberPattern(value:Number, tol:Number = 1e-12) {
			$value = value;
			$tol = tol;
		}
		
		public override function matchs(arg:*):Boolean {
			return FloatUtil.equals(arg, $value, $tol);
		}
	}
}