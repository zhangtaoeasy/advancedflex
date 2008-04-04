package advancedflex.utils.overload.patterns {
	public final class AnyPattern implements IParamPattern {
		
		public static const instance:AnyPattern = new AnyPattern();
		
		public final function matchs(arg:*):Boolean {
			return true;
		}
		
	}
}