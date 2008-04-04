package advancedflex.utils.overload.patterns {
	public class NullPattern implements IParamPattern {
		public function matchs(arg:*):Boolean {
			return arg == null;
		}
		
	}
}