/////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2007 Advanced Flex Project http://code.google.com/p/advancedflex/. 
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package advancedflex.math.utils {
	
	/**
	 * 此类用于生成各种伪随机数。
	 */
	public class Random {
		
		/**
		 * 用雅可比变换生成一个呈高斯分布的伪随机数。
		 * 
		 * @param mu 平均值μ
		 * @param sigma 标准差σ^2
		 * 
		 * @return 伪随机数。
		 */
		public static function getGaussian(mu:Number = 0, sigma:Number = 1):Number {
			var r1:Number = Math.random();
			var r2:Number = Math.random();
			return Math.sqrt( -2*Math.log(r1) ) * Math.cos( 2*Math.PI*r2 ) * sigma+mu;
		}
		
		private static var nextNextGaussian:Number;
		private static var haveNextNextGaussian:Boolean = false;
		
		/**
		 * 用极坐标法(polar method)生成一个呈高斯分布的伪随机数。
		 * 
		 * <p>这使用了 G. E. P. Box、M. E. Muller 和 G. Marsaglia 的极坐标法 (polar method)，
		 * 该方法在 Donald E. Knuth 的 The Art of Computer Programming, 
		 * Volume 3:Seminumerical Algorithms 的第 3.4.1 节，小节 C，算法 P 中进行了描述。
		 * 注意，它只需调用一次 StrictMath.log 和调用一次 StrictMath.sqrt> 就可以生成两个独立的值。</p>
		 * 
		 * @param mu 平均值μ
		 * @param sigma 标准差σ^2
		 * 
		 * @return 伪随机数。
		 */
		public static function getGaussian2(mu:Number = 0, sigma:Number = 1):Number {
			if (haveNextNextGaussian) {
				haveNextNextGaussian = false;
		 		return nextNextGaussian;
			} else {
				var v1:Number, v2:Number, s:Number;
				do {
					v1 = 2 * Math.random() - 1;	// between -1.0 and 1.0
					v2 = 2 * Math.random() - 1;	// between -1.0 and 1.0
				 	s = v1 * v1 + v2 * v2;
				} while (s >= 1 || s == 0);
				var multiplier:Number = Math.sqrt(-2 * Math.log(s)/s);
				nextNextGaussian = v2 * multiplier;
				haveNextNextGaussian = true;
				return v1*multiplier*sigma + mu;
			}
		}
		
		/**
		 * 生成一个 (0 ≤ X < int.MAX_VALUE) 的int类型的伪随机数。
		 * @return 伪随机数。
		 */
		public static function getInt():int {
			return int(Math.random() * int.MAX_VALUE);
		}
		
		/**
		 * 生成一个 (0 ≤ X < uint.MAX_VALUE) 的uint类型的伪随机数。
		 * @return 伪随机数。
		 */
		public static function getUnsignedInt():int {
			return uint(Math.random() * uint.MAX_VALUE);
		}
		
		/**
		 * 生成一个 (0 ≤ X < Number.MAX_VALUE) 的Number类型的伪随机数。
		 * @return 伪随机数。
		 */
		public static function getDouble():int {
			return Math.random() * Number.MAX_VALUE;
		}
		
		/**
		 * 生成一个 (a ≤ X < b) 的int类型的伪随机数。
		 * 
		 * @param a 下限
		 * @param b 上限
		 * @return 伪随机数。
		 */
		public static function getIntR(a:int, b:int):int {
			return a + int(Math.random() * (b-a));
		}
		
		/**
		 * 生成一个 (a ≤ X < b) 的uint类型的伪随机数。
		 * 
		 * @param a 下限
		 * @param b 上限
		 * @return 伪随机数。
		 */
		public static function getUnsignedIntR(a:uint, b:uint):int {
			return uint(Math.random() * uint.MAX_VALUE);
		}
		
		/**
		 * 生成一个 (a ≤ X < b) 的Number类型的伪随机数。
		 * 
		 * @param a 下限
		 * @param b 上限
		 * @return 伪随机数。
		 */
		public static function getDoubleR(a:Number, b:Number):int {
			return a + Math.random() * (b-a);
		}
		
		/**
		 * 生成一个伪随机 boolean 值。
		 * @return boolean 值。
		 */
		public static function getBoolean():Boolean {
			return Math.random() < 0.50;
		}
	}
}