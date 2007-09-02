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
	 * Gudermannian function<br/>
	 * 古德曼函数
	 */
	public final class Gud {
		
		/**
		 * Gudermannian function<br/>
		 * 古德曼函数
		 */
		public static function gd(x:Number):Number {
			return 2*Math.atan( Math.exp(x) ) - Math.PI/2;
		}
		
		/**
		 * Anti-gudermannian function<br/>
		 * 反古德曼函数
		 */
		public static function agd(x:Number):Number {
			return Math.log( (1+Math.sin(x)) / (1-Math.sin(x)) ) / 2
		}
	}
}