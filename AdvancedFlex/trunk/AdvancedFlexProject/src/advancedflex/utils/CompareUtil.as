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
	import flash.utils.describeType;
	import flash.utils.ByteArray;
	
	
	/**
	 * 一个关于比较的 Util 类。它不能创建实例。
	 */
	public class CompareUtil {
		
		/**
		 * 在考虑计算误差的情况下，判断两个浮点小数是否相等。
		 * 
		 * @param a 一个浮点小数。
		 * @param b 另一个浮点小数。
		 * @param tol 允许的最大浮点小数的计算误差。
		 * @return 如果相等，返回 true；否则返回 false。
		 */
		public static function eqFloat(a:Number, b:Number, 
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
		public static function compareFloat(a:Number, b:Number, 
			tol:Number = 1e-12):int 
		{
			return 	eqFloat(a, b, tol) ? 0 :
					a < b ? -1 :
					1;
		}
		
		/**
		 * 在考虑计算误差的情况下，判断两个浮点小数的数组是否相等。
		 * 
		 * @param a 一个浮点小数的数组。
		 * @param b 另一个浮点小数的数组。
		 * @param tol 允许的最大浮点小数的计算误差。
		 * @return 如果相等，返回 true；否则返回 false。
		 */
		public static function eqFloatArray(a:Array, b:Array, 
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
				if(!eqFloat(a[i], b[i], tol)) {
					return false;
				}
			}
			return true;
		}
		
		/**
		 * 使用 <code>===</code> 来判断两个浮点小数是否相等。
		 * 
		 * @param a 一个数组。
		 * @param b 另一个数组。
		 * @return 如果相等，返回 true；否则返回 false。
		 */
		public static function eqArray(a:Array, b:Array):Boolean {
			if(a === b) {
				return true;
			}
			if(a.length != b.length) {
				return false;
			}
			var l:int = a.length;
			for(var i:int = 0; i < l; i++) {
				if(a[i] !== b[i]) {
					return false;
				}
			}
			return true;
		}
		
		/**
		 * 判断两个 ByteArray 是否相等。
		 * 
		 * @param a 一个 ByteArray。
		 * @param b 另一个 ByteArray。
		 * @return 如果相等，返回 true；否则返回 false。
		 */
		public static function eqByteArray(a:ByteArray, b:ByteArray):Boolean {
			if(a === b) {
				return true;
			}
			if(a.length != b.length) {
				return false;
			}
			var posA:int = a.position;
			var posB:int = b.position;
			var result:Boolean = true;
			a.position = b.position = 0;
			while(a.bytesAvailable >= 4) {
				if(a.readUnsignedInt() != b.readUnsignedInt()) {
					result = false;
					break;
				}
			}
			if(result && a.bytesAvailable != 0) {
				var last:int = a.bytesAvailable;
				result = 
					last == 1 ? a.readByte() == b.readByte() :
					last == 2 ? a.readShort() == b.readShort() :
					last == 3 ? a.readShort() == b.readShort()
						&& a.readByte() == b.readByte() :
					true;
			}
			a.position = posA;
			b.position = posB;
			return result;
		}
		
		/**
		 * 判断两个对象是否相等，它使用深层比较。
		 * @param a 一个对象。
		 * @param b 另一个对象。
		 * @return 如果相等，返回 true；否则返回 false。
		 */
		public static function eqObject(a:Object, b:Object):Boolean {
			if(a === b) {
				return true;
			}
			var bytesA:ByteArray = new ByteArray()
			bytesA.writeObject(a);
			var bytesB:ByteArray = new ByteArray()
			bytesB.writeObject(b);
			return eqByteArray(bytesA, bytesB);
		}
		
		/**
		 * 判断两个对象的数据类型是否一样。
		 * 
		 * @param a 一个对象。
		 * @param b 另一个对象。
		 * @return 如果一样，返回 <code>true</code>；否则返回 <code>false</code>。
		 */
		public static function eqType(a:Object, b:Object):Boolean {
			return 	a === b
				||	describeType(a).@name == describeType(b).@name;
		}
	}
}