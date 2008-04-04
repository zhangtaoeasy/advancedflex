package advancedflex.utils.overload.patterns {
	import advancedflex.utils.RegExpUtil;
	
	public class RegExpPattern implements IParamPattern {
		
		private var $regexp:RegExp;
		
		public function RegExpPattern(pattern:RegExp) {
			$regexp = pattern;
		}

		public function matchs(arg:*):Boolean {
			return RegExpUtil.matchAll(arg, $regexp);
		}
		
	}
}