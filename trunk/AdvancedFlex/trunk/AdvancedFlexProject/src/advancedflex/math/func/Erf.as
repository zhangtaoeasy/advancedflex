package advancedflex.math.func {
	public class Erf {
		private static const $2_OVER_SQRT_PI:Number = 2 / Math.sqrt(Math.PI);
		public static function byLoop(x:Number, times:int):Number {
			var result:Number = x;
			var l:Number = 1;
			for(var n:int=1; n<times; n++) {
				var up:Number = Math.pow(x, 2*n+1);
				var down:Number = l*(2*n+1);
				l*=n;
				if(n%2) {
					result +=up/down
				}else{
					result -=up/down
				}
			}
			return result*$2_OVER_SQRT_PI;
		}
		public static function byTil(x:Number, error:Number = 0.00000001):Number {
			var result:Number = x;
			var l:Number = 1;
			var n:int = 1;
			var diff:Number;
			var old:Number = x;
			do {
				var up:Number = Math.pow(x, 2*n+1);
				var down:Number = l*(2*n+1);
				l*=n;
				if(n%2) {
					result +=up/down
				}else{
					result -=up/down
				}
				n++;
				diff = Math.abs(result - old);
				old = result;
			} while(diff > error);
			return result*$2_OVER_SQRT_PI;
		}
	}
}