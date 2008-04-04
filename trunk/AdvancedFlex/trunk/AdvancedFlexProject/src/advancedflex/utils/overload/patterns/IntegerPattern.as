package advancedflex.utils.overload.patterns {
	
	public class IntegerPattern extends NumericPattern {
		
		public override function matchs(arg:*):Boolean {
			return int(arg) === arg;
		}
	}
}