package advancedflex.utils.overload.patterns {
	public class StringPattern implements IParamPattern {
		
		private var $string:String;
		
		public function StringPattern(string:String) {
			$string = string;
		}

		public function matchs(arg:*):Boolean
		{
			return $string === arg;
		}
		
	}
}