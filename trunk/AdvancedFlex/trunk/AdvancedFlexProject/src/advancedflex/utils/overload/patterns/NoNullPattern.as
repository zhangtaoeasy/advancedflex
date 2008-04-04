package advancedflex.utils.overload.patterns {
	
	public class NoNullPattern implements IParamPattern {
		
		public function matchs(arg:*):Boolean {
			return arg != null;
		}
		
	}
}