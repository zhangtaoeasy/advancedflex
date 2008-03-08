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
	import flash.utils.ByteArray;
	import flash.utils.IDataOutput;
	
	public class ByteArrayUtil {
		
		/**
		 * 判断两个 ByteArray 是否相等。
		 * 
		 * @param a 一个 ByteArray。
		 * @param b 另一个 ByteArray。
		 * @return 如果相等，返回 true；否则返回 false。
		 */
		public static function equals(a:ByteArray, b:ByteArray):Boolean {
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
		 * 把 ByteArray 转换为 16 进制。
		 * 格式为 "<code>BB BB BB BB BB BB BB BB|BB BB...</code>"，"BB" 表示一个字节。
		 * 
		 * @param bytes ByteArray
		 * @return 把 ByteArray 转换为16进制后的字符串。
		 */
		public static function toHex(bytes:ByteArray):String {
			var pos:int = bytes.position;
			bytes.position = 0;
			var result:String = "";
			while(bytes.bytesAvailable >= 8) {
				result += 	$toHexNum(bytes.readUnsignedByte()) + " "
					+ 		$toHexNum(bytes.readUnsignedByte()) + " "
					+ 		$toHexNum(bytes.readUnsignedByte()) + " "
					+ 		$toHexNum(bytes.readUnsignedByte()) + " "
					+ 		$toHexNum(bytes.readUnsignedByte()) + " "
					+ 		$toHexNum(bytes.readUnsignedByte()) + " "
					+ 		$toHexNum(bytes.readUnsignedByte()) + " "
					+ 		$toHexNum(bytes.readUnsignedByte()) + "|";
			}
			while(bytes.bytesAvailable>1) {
				result += $toHexNum(bytes.readUnsignedByte()) + " "
			}
			if(bytes.bytesAvailable) {
				result += $toHexNum(bytes.readUnsignedByte());
			}
			bytes.position = pos;
			return result;
		}
		
		/**
		 * @private
		 * 
		 * 把 1 个字节转换为 16 进制的字符串。
		 * 
		 * @param n 1 个字节。
		 * @return 16 进制的字符串。
		 */
		private static function $toHexNum(n:uint):String {
			return (n <= 0xF ? "0" + n.toString(16) : n.toString(16)).toUpperCase();
		}
		
		/**
		 * 连接 ByteArray。把 args 依次写入 result 里。
		 * 
		 * @param result 返回结果的对象指针。
		 * @param args 需要连接的 ByteArray。
		 * @return result。
		 */
		public static function concat(result:IDataOutput, ...args):IDataOutput {
			var length:int = args.length;
			for(var i:int = 0; i < length; i++) {
				result.writeBytes(args[i]);
			}
			return result;
		}
		
		/**
		 * 截取原始 <code>ByteArray</code> 中某一范围的元素构成的新 <code>ByteArray</code>。
		 * 返回的 <code>ByteArray</code> 包括 start 元素以及从其开始到 end 元素（但不包括该元素）的所有元素。
		 * 
		 * @param bytes 原始 <code>ByteArray</code>
		 * @param result 返回指针，如果为 <code>null</code>，将会创建新的 <code>ByteArray</code>。
		 * @param start 开始下标，负数表示从后面开始数。
		 * @param end 结束下标，负数表示从后面开始数。
		 * @return result
		 */
		public static function slice(
			bytes:ByteArray, result:IDataOutput = null, 
			start:int = 0, end:int = -1):IDataOutput
		{
			if(!bytes) {
				throw new ArgumentError("Param:<bytes> must not be null.");
			}
			var totalLength:int = bytes.length;
			if(!result)	result = new ByteArray();
			if(start<0)	start = totalLength + start;
			if(end<0)	end = totalLength + end;
			var length:int = end - start + 1;
			result.writeBytes(bytes, start, length);
			return result;
		}
	}
}