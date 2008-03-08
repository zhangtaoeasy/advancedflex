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
	 * BaseX(Base64，Base85等)的解码器的接口。
	 * BaseX 的解码器是把使用 BaseX 编码后的字符串解码为2进制数据或 Unicode。
	 */
	public interface IBaseXDecoder {
		
		/**
		 * 把编码后的 String 解码为 ByteArray，并输出到指定的输出流。
		 * 
		 * @param data 把编码后的 String。
		 * @param output 输出流。
		 * @param decharSet 逆字符集，默认值根据具体实现的解码器来定。
		 * @see advancedflex.io.codec.IBaseXEncoder#encode
		 */
		public static function decode(data:String, output:IDataOutput, decharSet:Object = null):void;
		
		/**
		 * 把编码后的 String 解码为 Unicode。
		 * 
		 * @param src 编码后的 String。
		 * @param charSet BaseX 的字符集，默认值根据具体实现的编码器来定。
		 * @return 原文。
		 * @see advancedflex.io.codec.IBaseXEncoder#encodeString
		 */
		public static function decodeString(src:String, charSet:Object = null):String;
	}
}