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
package advancedflex.io.codec {
	/**
	 * Base85的字符集(Character Set)
	 * 
	 * @see http://rfc.net/rfc1924.html RFC-1924
	 * @see Base85Decoder
	 * @see Base85Encoder
	 */
	public final class Base85CharSet {
		
		/**
		 * 在<strong>RFC-1924</strong>里定义的一般的字符集(根据编码算字符)
		 */
		 //0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!#$%&()*+-;<=>?@^_`{|}~
		public static const RFC_1924:Array = 
		[
			"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", 
			"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", 
			"K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", 
			"U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", 
			"e", "f", "g", "h", "i", "j", "k", "l", "m", "n", 
			"o", "p", "q", "r", "s", "t", "u", "v", "w", "x", 
			"y", "z", "!", "#", "$", "%", "&", "(", ")", "*", 
			"+", "-", ";", "<", "=", ">", "?", "@", "^", "_", 
			"`", "{", "|", "}", "~", 
		];
		/**
		 * 在<strong>RFC-1924</strong>里定义的一般的逆字符集(根据字符算编码)
		 */
		public static const DECODE_RFC_1924:Object = 
		{
			"0":0,  "1":1,  "2":2,  "3":3,  "4":4,  "5":5,  "6":6,  "7":7,  "8":8, "9":9, 
			"A":10, "B":11, "C":12, "D":13, "E":14, "F":15, "G":16, "H":17, "I":18, "J":19, 
			"K":20, "L":21, "M":22, "N":23, "O":24, "P":25, "Q":26, "R":27, "S":28, "T":29, 
			"U":30, "V":31, "W":32, "X":33, "Y":34, "Z":35, "a":36, "b":37, "c":38, "d":39, 
			"e":40, "f":41, "g":42, "h":43, "i":44, "j":45, "k":46, "l":47, "m":48, "n":49, 
			"o":50, "p":51, "q":52, "r":53, "s":54, "t":55, "u":56, "v":57, "w":58, "x":59, 
			"y":60, "z":61, "!":62, "#":63, "$":64, "%":65, "&":66, "(":67, ")":68, "*":69, 
			"+":70, "-":71, ";":72, "<":73, "=":74, ">":75, "?":76, "@":77, "^":78, "_":79, 
			"`":80, "{":81, "|":82, "}":83, "~":84
		};
		/**
		 * 在<strong>ascii85</strong>里定义的一般的字符集(根据编码算字符)
		 */
		 //!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuv
		public static const ASCII85:Array = 
		[
			"!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", 
			"+", ",",  "-", ".", "/", "0", "1", "2", "3", "4", 
			"5", "6",  "7", "8", "9", ":", ";", "<", "=", ">", 
			"?", "@",  "A", "B", "C", "D", "E", "F", "G", "H", 
			"I", "J",  "K", "L", "M", "N", "O", "P", "Q", "R", 
			"S", "T",  "U", "V", "W", "X", "Y", "Z", "[", "]", 
			"^", "_",  "`", "a", "b", "c", "d", "e", "f", "g", 
			"h", "i",  "j", "k", "l", "m", "n", "o", "p", "q", 
			"r", "s",  "t", "u", "v",
		];
		/**
		 * 在<strong>ascii85</strong>里定义的一般的字符集(根据编码算字符)
		 */
		public static const DECODE_ASCII85:Object =
		{
			"!":0,  "\"":1, "#":2,  "$":3,  "%":4,  "&":5,  "'":6,  "(":7,  ")":8,  "*":9, 
			"+":10, ",":11, "-":12, ".":13, "/":14, "0":15, "1":16, "2":17, "3":18, "4":19, 
			"5":20, "6":21, "7":22, "8":23, "9":24, ":":25, ";":26, "<":27, "=":28, ">":29, 
			"?":30, "@":31, "A":32, "B":33, "C":34, "D":35, "E":36, "F":37, "G":38, "H":39, 
			"I":40, "J":41, "K":42, "L":43, "M":44, "N":45, "O":46, "P":47, "Q":48, "R":49, 
			"S":50, "T":51, "U":52, "V":53, "W":54, "X":55, "Y":56, "Z":57, "[":58, "]":59, 
			"^":60, "_":61, "`":62, "a":63, "b":64, "c":65, "d":66, "e":67, "f":68, "g":69, 
			"h":70, "i":71, "j":72, "k":73, "l":74, "m":75, "n":76, "o":77, "p":78, "q":79, 
			"r":80, "s":81, "t":82, "u":83, "v":84
		}
	}
}