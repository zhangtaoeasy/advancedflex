package advancedflex.utils.overload.patterns {
	public class WrapperPattern implements IParamPattern {
		
		private var $pattern:Object;
		
		public function WrapperPattern(pattern:Object) {
			$pattern = pattern;
		}
		
		public function matchs(arg:*):Boolean {
			for(var p:String in $pattern) {
				if(!IParamPattern($pattern[p]).matchs(arg[p])) {
					return false;
				}
			}
			return true;
		}
	}
}