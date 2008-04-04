package advancedflex.utils.overload.patterns {
	
	public class NumberRangePattern extends NumericPattern {
		
		private var $low:Number;
		
		private var $high:Number;
		
		private var $containsLowBorder:Boolean;
		
		private var $containsHighBorder:Boolean;
		
		public function NumberRangePattern(
			low:Number, high:Number, 
			containsLowBorder:Boolean = true, containsHighBorder:Boolean = true)
		{
			$low = low;
			$high = high;
			$containsLowBorder = containsLowBorder;
			$containsHighBorder = containsHighBorder;
		}
		
		public override function matchs(arg:*):Boolean {
			return super.matchs(arg) && 
				($containsLowBorder  ? arg >= $low  : arg > $low ) &&
				($containsHighBorder ? arg <= $high : arg < $high);
		}
	}
}