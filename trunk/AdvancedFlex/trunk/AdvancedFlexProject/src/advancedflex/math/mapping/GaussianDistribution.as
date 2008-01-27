package advancedflex.math.mapping {
	public class GaussianDistribution implements IMapping1d {
		
		public var mu:Number;
		
		public var sigma:Number;
		public var scalar:Number;
		
		public function GaussianDistribution(mu:Number = 0, sigma:Number = 1, scalar:Number = 1) {
			this.mu = mu;
			this.sigma = sigma;
			this.scalar = scalar;
		}
		
		private const $SQRT_2PI:Number = Math.sqrt(2*Math.PI);
		public function getValue(x:Number):Number {
			var x_mu:Number = x - mu;
			return scalar * ( 1 / (sigma*$SQRT_2PI) ) * Math.exp( - (x_mu*x_mu) / (2*sigma*sigma) );
		}
		private static const range:Range = new Range(-Infinity, Infinity);
		public function get range():Range {
			return range;
		}
		public function getValueRange(range:Range):Range {
			if(range.contains(mu)) {
				return new Range(getValue(range.far(mu)), getValue(mu));
			}else{
				var left:Number = getValue(range.low);
				var right:Number = getValue(range.high);
				return new Range(Math.min(left, right), Math.max(left, right));
			}
		}
		public function inRange(x:Number):Boolean {
			return !isNaN(x);
		}
		
	}
}