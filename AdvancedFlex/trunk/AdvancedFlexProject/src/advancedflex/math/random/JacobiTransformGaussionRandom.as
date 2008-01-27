package advancedflex.math.random {
	public class JacobiTransformGaussionRandom extends AbstractRandom {
		public function setRange(low:Number = 0, high:Number = 1):JacobiTransformGaussionRandom {
			if(low > high) {
				throw new ArgumentError("low must less than high.")
			}
			mu = (low+high) / 2;
			sigma = (high-low) / 6;
			return this;
		}
		public function get mean():Number {
			return mu - 0.5;
		}
		public function get standardDeviation():Number {
			return sigma / 6;
		}
		protected var mu:Number = 0.5;
		protected var sigma:Number = 1/3;
		public final override function random():Number {
			var result:Number;
			do {
				result = $random();
			} while(result < 0 || result >= 1);
			return result;
		}
		private final function $random():Number {
			var r1:Number = Math.random();
			var r2:Number = Math.random();
			return Math.sqrt( -2*Math.log(r1) ) * Math.cos( 2*Math.PI*r2 ) * sigma + mu;
		}
	}
}