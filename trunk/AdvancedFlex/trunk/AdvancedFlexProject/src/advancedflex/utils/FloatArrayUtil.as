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
	
	/**
	 * 一个关于浮点小数的数组的 Util 类。它不能创建实例。
	 */
	public class FloatArrayUtil extends ArrayUtil {
		
		/**
		 * 在考虑计算误差的情况下，判断两个浮点小数的数组是否相等。
		 * 
		 * @param a 一个浮点小数的数组。
		 * @param b 另一个浮点小数的数组。
		 * @param tol 允许的最大浮点小数的计算误差。
		 * @return 如果相等，返回 true；否则返回 false。
		 */
		public static function equals(a:Array, b:Array, 
			tol:Number = 1e-12):Boolean 
		{
			if(a === b) {
				return true;
			}
			if(a.length != b.length) {
				return false;
			}
			var l:int = a.length;
			for(var i:int = 0; i < l; i++) {
				if(!FloatUtil.equals(a[i], b[i], tol)) {
					return false;
				}
			}
			return true;
		}
		
		/**
		 * 两个浮点小数的数组相加。
		 * 
		 * @param a 一个浮点小数的数组。
		 * @param b 另一个浮点小数的数组。
		 * @param result 返回结果的数组，如果为 null，将会创建新的数组返回。
		 * @return 结果。如果 result 不为 null，将会返回 result；否则将会创建新的数组返回。
		 */
		public static function addArray(a:Array, b:Array, result:Array = null):Array {
			result = !result ? [] : result;
			var length:int = Math.max(a.length, b.length);
			for(var i:int = 0; i < length; i++) {
				result[i] = a[i] + b[i];
			}
			return result;
		}
		
		/**
		 * 
		 * @param a
		 * @param n
		 * @param result
		 * @return 
		 * 
		 */
		public static function addFloat(a:Array, n:Number, result:Array = null):Array {
			result = !result ? [] : result;
			var length:int = a.length
			for(var i:int = 0; i < length; i++) {
				result[i] = a[i] + n;
			}
			return result;
		}
		
		/**
		 * 两个浮点小数的数组相减。
		 * 
		 * @param a 一个浮点小数的数组。
		 * @param b 另一个浮点小数的数组。
		 * @param result 返回结果的数组，如果为 null，将会创建新的数组返回。
		 * @return 结果。如果 result 不为 null，将会返回 result；否则将会创建新的数组返回。
		 */
		public static function subArray(a:Array, b:Array, result:Array = null):Array {
			result = !result ? [] : result;
			var length:int = Math.max(a.length, b.length);
			for(var i:int = 0; i < length; i++) {
				result[i] = a[i] - b[i];
			}
			return result;
		}
		
		public static function subFloat(a:Array, n:Number, result:Array = null):Array {
			result = !result ? [] : result;
			var length:int = a.length
			for(var i:int = 0; i < length; i++) {
				result[i] = a[i] - n;
			}
			return result;
		}
		
		/**
		 * 两个浮点小数的数组相乘。
		 * 
		 * @param a 一个浮点小数的数组。
		 * @param b 另一个浮点小数的数组。
		 * @param result 返回结果的数组，如果为 null，将会创建新的数组返回。
		 * @return 结果。如果 result 不为 null，将会返回 result；否则将会创建新的数组返回。
		 */
		public static function multArray(a:Array, b:Array, result:Array = null):Array {
			result = !result ? [] : result;
			var length:int = Math.max(a.length, b.length);
			for(var i:int = 0; i < length; i++) {
				result[i] = a[i] * b[i];
			}
			return result;
		}
		
		public static function multFloat(a:Array, n:Number, result:Array = null):Array {
			result = !result ? [] : result;
			var length:int = a.length
			for(var i:int = 0; i < length; i++) {
				result[i] = a[i] * n;
			}
			return result;
		}
		
		/**
		 * 
		 * @param a
		 * @param b
		 * @param method
		 * @param result
		 * @return 
		 * 
		 */
		public static function map(a:Array, b:Array, method:Function, result:Array = null):Array {
			result = !result ? [] : result;
			var length:int = Math.max(a.length, b.length);
			for(var i:int = 0; i < length; i++) {
				result[i] = method(a[i], b[i]);
			}
			return result;
		}
		
		/**
		 * 使用二分法查找法来搜索数组的元素。
		 * 
		 * @param sortedArray 排成升序(从小到大)的数组。
		 * @param value 要查找的值。
		 * @param tol 浮点小数的计算误差。
		 * @return 元素的下标。如果没有，则返回 <code>-1<code>。
		 * @throws ArgumentError 如果 <code>sortedArray</code> 为 <code>null</code>。
		 */
		public static function bsearch(sortedArray:Array, value:Number, tol:Number = 1e-12):int {
			if(!sortedArray) {
				throw new ArgumentError("Param:<sortedArray> must not be null.");
			}
			return $bsearch(sortedArray, value, tol, 0, sortedArray.length-1);
		}
		/**
		 * @private
		 * 使用二分查找法来搜索数组的元素。
		 * 
		 * @param sortedArray 排成升序(从小到大)的数组。
		 * @param value 要查找的值。
		 * @param tol 浮点小数的计算误差。
		 * @param left 查找的最左边。
		 * @param right 查找的最右边。
		 * @return 元素的下标。如果没有，则返回 -1。
		 */
		private static function $bsearch(
			sortedArray:Array, value:Number, tol:Number,
			left:int, right:int):int 
		{
			if(right - left <= 1) {
				return FloatUtil.equals(sortedArray[left], value, tol) ? left :
					FloatUtil.equals(sortedArray[right], value, tol) ? left :
					-1;
			}
			var center:int = (left+right)/2;
			switch(FloatUtil.compare(sortedArray[center], value, tol)) {
				case 1 :
					return $bsearch(sortedArray, value, tol, left, center);
				case -1:
					return $bsearch(sortedArray, value, tol, center, right);
				default:
					return center;
			}
		}
		
		/**
		 * 使用黄金分割查找法来搜索数组的元素。
		 * 
		 * @param sortedArray 排成升序(从小到大)的数组。
		 * @param value 要查找的值。
		 * @param tol 浮点小数的计算误差。
		 * @return 元素的下标。如果没有，则返回 -1。
		 */
		public static function gsearch(sortedArray:Array, value:Number, tol:Number = 1e-12):int {
			if(!sortedArray) {
				throw new ArgumentError("Param:<sortedArray> must not be null.");
			}
			return $gsearch(sortedArray, value, tol, 0, sortedArray.length);
		}
		
		/**
		 * @private
		 */
		private static const $LEFT_RATIO:Number = 0.6180339887498949;
		
		/**
		 * @private
		 */
		private static const $RIGHT_RATIO:Number = 1 - $LEFT_RATIO;
		
		 /**
		 * @private
		 * 使用黄金分割查找法来搜索数组的元素。
		 * 
		 * @param sortedArray 排成升序(从小到大)的数组。
		 * @param value 要查找的值。
		 * @param tol 浮点小数的计算误差。
		 * @param left 查找的最左边。
		 * @param right 查找的最右边。
		 * @return 元素的下标。如果没有，则返回 -1。
		 */
		private static function $gsearch(
			sortedArray:Array, value:Number, tol:Number,
			left:int, right:int):int 
		{
			if(right - left <= 1) {
				return FloatUtil.equals(sortedArray[left], value, tol) ? left :
					FloatUtil.equals(sortedArray[right], value, tol) ? left :
					-1;
			}
			var center:int = $RIGHT_RATIO*left + $LEFT_RATIO*right
			switch(FloatUtil.compare(sortedArray[center], value, tol)) {
				case 1 :
					return $gsearch(sortedArray, value, tol, left, center);
				case -1:
					return $gsearch(sortedArray, value, tol, center, right);
				default:
					return center;
			}
		}
		public static function isFloatArray(array:Array):Boolean {
			for each(var v:* in array) {
				if(typeof v != "number") {
					return false;
				}
			}
			return true;
		}
		
		/**
		 * 
		 * @param array
		 * @return 
		 * 
		 */
		public static function sum(array:Array):Number {
			var tmp:Number = 0;
			for each(var v:Number in array) {
				tmp += v;
			}
			return tmp;
		}
		
		/**
		 * 
		 * @param array
		 * @return 
		 * 
		 */
		public static function squareSum(array:Array):Number {
			var tmp:Number = 0;
			for each(var v:Number in array) {
				tmp += v*v;
			}
			return tmp;
		}
		
		/**
		 * 
		 * @param array
		 * @return 
		 * 
		 */
		public static function mult(array:Array):Number {
			var tmp:Number = 1;
			for each(var v:Number in array) {
				tmp *= v;
			}
			return tmp;
		}
		
		/**
		 * 
		 * @param array
		 * @return 
		 * 
		 */
		public static function ArithmeticMean(array:Array):Number {
			return sum(array) / array.length;
		}
		
		/**
		 * 
		 * @param array
		 * @return 
		 * 
		 */
		public static function geomMean(array:Array):Number {
			return Math.pow(mult(array), 1/array.length);
		}
		
		/**
		 * 
		 * @param array
		 * @return 
		 * 
		 */
		public static function harmonicMean(array:Array):Number {
			var tmp:Number = 0;
			for each(var v:Number in array) {
				tmp += 1/v;
			}
			return array.length/tmp;
		}
		
		public static function findNearest(array:Array, value:Number):int {
			var pos:int;
			var diff:Number = Number.POSITIVE_INFINITY;
			var tmp:Number;
			var length:int = array.length;
			for(var i:int = 0; i < length; i++) {
				tmp = Math.abs(array[i] - value);
				if(diff > tmp) {
					diff = tmp;
					pos = i;
				}
			}
			return pos;
		}
	}
}