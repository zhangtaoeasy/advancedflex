package advancedflex.utils.overload.patterns {
	public class RestPattern implements IParamPattern {
		
		private var $pattern:IParamPattern;
		
		public static const REST_ARGS:RestPattern = new RestPattern();

		public function matchs(arg:*):Boolean {
			return false;
		}
		
	}
}