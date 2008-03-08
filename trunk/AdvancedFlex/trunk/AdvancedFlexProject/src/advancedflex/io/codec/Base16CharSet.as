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

package advancedflex.io.codec {
	
	/**
	 * Base16的字符集(Character Set)
	 * 
	 * @see http://rfc.net/rfc1924.html RFC-1924
	 * @see Base16Decoder
	 * @see Base16Encoder
	 */
	public class Base16CharSet {
		
		/**
		 * 在<strong>RFC-3548</strong>里定义的字符集(根据编码算字符)。
		 * 字符集为 <code>"0123456789ABCDEF"</code>。
		 * 
		 * @see #DECODE_RFC_3548
		 * @see #RFC_3548_SMALL
		 * @see http://rfc.net/rfc3548.html RFC-3548
		 */
		public static const RFC_3548:Array = [
			"0", "1", "2", "3",
			"4", "5", "6", "7",
			"8", "9", "A", "B",
			"C", "D", "E", "F",
		];
		
		/**
		 * 在<strong>RFC-1924</strong>里定义的逆字符集(根据字符算编码)。
		 * 
		 * @see #RFC_3548
		 * @see #DECODE_RFC_3548_SMALL
		 * @see http://rfc.net/rfc3548.html RFC-3548
		 */
		public static const DECODE_RFC_3548:Object = {
			"0" : 0, "1" : 1, "2" : 2, "3" : 3,
			"4" : 4, "5" : 5, "6" : 6, "7" : 7,
			"8" : 8, "9" : 9, "A" :10, "B" :11,
			"C" :12, "D" :13, "E" :14, "F" :15
		};
		
		/**
		 * 把<strong>RFC-3548</strong>里定义的字符集中大写字母转换为小写字母的字符集(根据编码算字符)。
		 * 字符集为 <code>"0123456789abcdef"</code>。
		 * 
		 * @see #DECODE_RFC_3548_SMALL
		 * @see #RFC_3548
		 * @see http://rfc.net/rfc3548.html RFC-3548
		 */
		public static const RFC_3548_SMALL:Array = [
			"0", "1", "2", "3",
			"4", "5", "6", "7",
			"8", "9", "a", "b",
			"c", "d", "e", "f",
		];
		
		/**
		 * 把<strong>RFC-3548</strong>里定义的字符集中大写字母转换为小写字母的逆字符集(根据字符算编码)。
		 * 
		 * @see #RFC_3548_SMALL
		 * @see #DECODE_RFC_3548
		 * @see http://rfc.net/rfc3548.html RFC-3548
		 */
		public static const DECODE_RFC_3548_SMALL:Object = {
			"0" : 0, "1" : 1, "2" : 2, "3" : 3,
			"4" : 4, "5" : 5, "6" : 6, "7" : 7,
			"8" : 8, "9" : 9, "a" :10, "b" :11,
			"c" :12, "d" :13, "e" :14, "f" :15
		};
	}
}