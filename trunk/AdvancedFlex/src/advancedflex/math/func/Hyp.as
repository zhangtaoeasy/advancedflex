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
package advancedflex.math.func {
	
	
	/**
	 * Hyperbolic Functions<br/>
	 * 双曲函数
	 */
	public final class Hyp {
		
		/**
		 * Hyperbolic sine Functions<br/>
	 	 * 双曲正弦函数
		 */
		public static function sinh(x:Number):Number {
			return (Math.exp(x) - Math.exp(-x)) / 2;
		}
		
		/**
		 * Hyperbolic cosine Functions<br/>
	 	 * 双曲余弦函数
		 */
		public static function cosh(x:Number):Number {
			return (Math.exp(x) + Math.exp(-x)) / 2;
		}
		
		/**
		 * Hyperbolic tangent Functions<br/>
	 	 * 双曲正切函数
		 */
		public static function tanh(x:Number):Number {
			return sinh(x) / cosh(x);
		}
		
		//Anti-function
		
		/**
		 * Anti-hyperbolic sine function<br/>
	 	 * 反双曲正弦函数
		 */
		public static function asinh(x:Number):Number {
			return Math.log( x + Math.sqrt(x*x + 1) );
		}
		
		/**
		 * Anti-hyperbolic cosine Functions<br/>
	 	 * 反双曲余弦函数<br/>
	 	 * 
	 	 * acoshp = ln(x+√(x^2-1))
		 */
		public static function acoshp(x:Number):Number {
			return Math.log( x + Math.sqrt(x*x - 1) );
		}
		
		/**
		 * Anti-hyperbolic cosine Functions<br/>
	 	 * 反双曲与弦函数<br/>
	 	 * 
	 	 * acoshm = ln(x-√(x^2-1))
		 */
		public static function acoshm(x:Number):Number {
			return Math.log( x - Math.sqrt(x*x - 1) );
		}
		
		/**
		 * Anti-hyperbolic tangent Functions<br/>
	 	 * 反双曲正切函数
		 */
		public static function atanh(x:Number):Number {
			return Math.log( (1+x) / (1-x) ) / 2
		}
	}
}