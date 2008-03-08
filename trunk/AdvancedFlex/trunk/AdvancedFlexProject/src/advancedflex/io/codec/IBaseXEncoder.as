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
	import flash.utils.ByteArray;
	
	/**
	 * BaseX(Base64，Base85等)的编码器的接口。
	 * BaseX 的编码器是把2进制数据或 Unicode 转换为在 Ascii 里定义的可打印的字符串。
	 */
	public interface IBaseXEncoder {
		
		/**
		 * 把 ByteArray 编码为 String。
		 * 
		 * @param bytes 原文(ByteArray)。
		 * @param charSet BaseX的字符集，默认值根据具体实现的编码器来定。
		 * @return 密文（原文编码后的数据）。
		 * @see advancedflex.io.codec.IBaseXDecoder#decode
		 */
		function encode(bytes:ByteArray, charSet:Array = null):String;
		
		/**
		 * 把 Unicode 编码为 String。
		 * 
		 * @param src 原文(Unicode)。
		 * @param charSet BaseX的字符集，默认值根据具体实现的编码器来定。
		 * @return 密文（原文编码后的数据）。
		 * @see advancedflex.io.codec.IBaseXDecoder#decodeString
		 */
		function encodeString(src:String, charSet:Array = null):String;
	}
}