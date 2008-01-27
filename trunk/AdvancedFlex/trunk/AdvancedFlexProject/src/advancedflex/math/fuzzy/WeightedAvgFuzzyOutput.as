package advancedflex.math.fuzzy
{
	public class WeightedAvgFuzzyOutput implements IFuzzyOutput
	{
		public function output(...args):Number
		{
			if(args.length % 2 != 0) {
				throw new ArgumentError("fuzzy.length does not equal weight.length.");
			}
			var fuzzySum:Number = 0;
			var weightSum:Number = 0;
			var isWeight:Boolean = true;
			var length:int = args.length;
			for (var i:int; i<length; i++) {
				isWeight = !isWeight;
				if(isWeight){
					fuzzySum += args[i-1]*args[i]
					weightSum += args[i];
				}
			}
			return fuzzySum / weightSum;
		}
		
	}
}