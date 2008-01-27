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
	import flash.utils.Dictionary;
	
	
	/**
	 * 一个关于数组的 Util 类。它不能创建实例。
	 */
	public class ArrayUtil {
		
		/**
		 * 打乱数组的排列顺序。
		 * 
		 * @param array 数组。
		 * @return 数组本身。
		 */
		public static function random(array:Array):Array {
			var length:int = array.length/2 + 1;
			var last:int = array.length;
			var idx:int;
			for(var i:int = 0; i < length; i++) {
				idx = i + int(Math.random()*last);
				last--;
				swap(array, i, idx);
			}
			return array;
		}
		
		/**
		 * 
		 * @param a
		 * @param b
		 * @return 
		 * 
		 */
		public static function equals(a:Array, b:Array):Boolean {
			if(!a || !b) {
				return false;
			}
			if(a.length != b.length) {
				return false;
			}
			var length:int = a.length;
			for(var i:int = 0; i < length; i++) {
				if(a[i] !== b[i]) {
					return false;
				}
			}
			return true;
		}
		
		/**
		 * 删除数组中的重复的元素。顺序为第一次出现的顺序。
		 * @sample <code>unique([1,1,2,1,3,2,1,1]) // -> [1,2,3]</code>
		 * @param array 数组。
		 * @return 删除给与数组中的重复的元素后的新数组。
		 * 
		 */
		public static function unique(array:Array):Array {
			var result:Array = [];
			var valueSet:Dictionary = new Dictionary(false);
			var length:int = array.length;
			for(var i:int = 0; i < length; i++) {
				if(!valueSet[array[i]]) {
					result.push(array[i]);
					valueSet[array[i]] = true;
				}
			}
			return result;
		}
		
		/**
		 * 得到指定的元素的个数。
		 * 
		 * @param array 数组。
		 * @param value 元素。
		 * @return 个数。
		 * @throws ArgumentError 当 <code>array</code> 为 <code>null</code> 时。
		 */
		public static function count(array:Array, value:*):int {
			if(!array) {
				throw new ArgumentError("Param:<array> must not be null.");
			}
			var found:int = 0;
			var length:int = array.length;
			for(var i:int = 0; i < length; i++) {
				if(array[i] == value) {
					found++;
				}
			}
			return found;
		}
		/**
		 * 交换数组中的两个下标的值。
		 * 
		 * @param array 数组。
		 * @param idx1 一个下标。
		 * @param idx2 另一个下标。
		 */
		public static function swap(array:Array, idx1:int, idx2:int):void {
			var tmp:* = array[idx1];
			array[idx1] = array[idx2];
			array[idx2] = tmp;
		}
	}
}