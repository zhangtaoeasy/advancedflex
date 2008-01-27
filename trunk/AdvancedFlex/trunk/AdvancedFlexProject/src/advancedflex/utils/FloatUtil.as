////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2007 Advanced Flex Project http://advancedflex.googlecode.com/. 
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
package advancedflex.utils {
	public class FloatUtil {
		
		/**
		 * 在考虑计算误差的情况下，判断两个浮点小数是否相等。
		 * 
		 * @param a 一个浮点小数。
		 * @param b 另一个浮点小数。
		 * @param tol 允许的最大浮点小数的计算误差。
		 * @return 如果相等，返回 true；否则返回 false。
		 */
		public static function equals(a:Number, b:Number, 
			tol:Number = 1e-12):Boolean 
		{
			return a == b || Math.abs(a - b) < tol;
		}
		
		/**
		 * 在考虑计算误差的情况下，判断两个浮点小数的大小。
		 * 
		 * @param a 一个浮点小数。
		 * @param b 另一个浮点小数。
		 * @param tol 允许的最大浮点小数的计算误差。
		 * @return  如果相等，返回 0；a<b，返回 -1；a>b，返回 1。
		 */
		public static function compare(a:Number, b:Number, 
			tol:Number = 1e-12):int 
		{
			return 	equals(a, b, tol) ? 0 :
					a < b ? -1 :
					1;
		}
	}
}