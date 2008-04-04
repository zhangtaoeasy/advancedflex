package advancedflex.utils.overload.patterns {
	import advancedflex.utils.FloatUtil;
	
	public class NumericPattern implements IParamPattern {

		public function matchs(arg:*):Boolean {
			return arg is Number;
		}
	}
}