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
package advancedflex.math.fuzzy {
	
	/**
	 * 一个为 f(x)=a 的模糊函数。
	 */
	public class ConstFuzzyFunction implements IFuzzyFunction {
		
		/**
		 * 函数的参数a。
		 */
		protected var a:Number
		
		/**
		 * 构造一个模糊函数。
		 * @param a 函数的参数a。
		 */
		public function ConstFuzzyFunction(a:Number) {
			if(a<0 || a>1) {
				throw new ArgumentError("A must be between 0 and 1.")
			}
			this.a = a;
		}
		
		public function value(x:Number):Number {
			return a;
		}
		
	}
}