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
	 * 微分
	 */
	public final class Differential {
		
		/**
		 * 微分。
		 * 
		 * @param f 被微分的函数
		 * @param x x。
		 * @param delta dx的大小。
		 * @return f(x)的斜率。
		 */
		public static function diff(f:Function, x:Number, delta:Number = 1e-8):Number {
			return (f(x+delta) - f(x)) / delta;
		}
		public static function diffFunc(f:Function, delta:Number = 1e-8):Function {
			return function(x:Number):Number {
				return (f(x+delta) - f(x)) / delta;
			};
		}
	}
}