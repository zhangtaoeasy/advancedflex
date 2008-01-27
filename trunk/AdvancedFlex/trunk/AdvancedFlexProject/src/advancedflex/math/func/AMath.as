package advancedflex.math.func {
	
	public final class AMath {
		
		/**
		 * Rounds a Number to an Integer with respect to its sign.<br/>
		 * 忽略符号的四舍五入。
		 * 
		 * <code>
		 * AMath.rint(1.2) //-> 1<br/>
		 * AMath.rint(-1.2)//-> -1<br/>
		 * AMath.rint(1.7) //-> 2<br/>
		 * AMath.rint(-1.7)//-> -2
		 * </code>
		 * @param v a Number
		 * @return Rounded Nuumber.
		 */
		public static function rint(v:Number):int {
			if(v > 0) {
				return int(v + 0.5);
			}
			if(v < 0) {
				return -int(-v + 0.5);
			}else{
				return 0;
			}
		}
		/**
		 * Returns the cube root of a Number.<br/>
		 * 立方根
		 * 
		 * @param v a Number
		 * @return the cube root of a Number.
		 * 
		 */
		public static function cbrt(v:Number):Number {
			return Math.pow(v, 1/3);
		}
		/**
		 * Returns the first floating-point argument with the sign of the second floating-point argument.
		 * @param magnitude 
		 * @param sign
		 * @return 
		 * 
		 */
		public static function copySign(magnitude:Number, sign:Number):Number {
			if(sign > 0) {//+
				return magnitude < 0 ? -magnitude : magnitude;
			}
			if(sign < 0) {//-
				return magnitude > 0 ? -magnitude : magnitude;
			}
			return magnitude;
		}
		
		public static function hypot(v1:Number, v2:Number):Number {
			return Math.sqrt(v1*v1 + v2*v2);
		}
		public static function log10(v:Number):Number {
			return Math.log(v) / Math.LN10;
		}
		public static function logN(base:int, v:Number):Number {
			return Math.log(v) / Math.log(base);
		}
		public static function toDegrees(angrad:Number):Number {
			return angrad * 180 / Math.PI;
		}
		public static function toRadians(angdeg:Number):Number {
			return angdeg * 180 / Math.PI;
		}
	}
}