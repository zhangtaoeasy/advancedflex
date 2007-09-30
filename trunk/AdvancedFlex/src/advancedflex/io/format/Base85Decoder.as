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
package advancedflex.io.format {
	
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import flash.utils.IDataOutput;
	
	/**
	 * Base85的解码器
	 * <p>他把5个字节的文本数据4转换为个字节的2进制数据。</p>
	 * @see Base85CharSet
	 * @see Base85Encoder
	 */
	public class Base85Decoder {

		/**
		 * 解码为String
		 * 
		 * @param src 密文
		 * @param charSet 逆字符集
		 * @return 原文
		 * 
		 * @see Base85CharSet#RFC_1924
		 * @see Base85Encoder#encode
		 */
		public static function decode(src:String, charSet:Object = null):String {
			var bytes:ByteArray = new ByteArray();
			bytes.writeUTFBytes(src);
			var mark:int = bytes.length;
			decodeByteArray(src, bytes, charSet ? charSet : Base85CharSet.RFC_1924);
			bytes.position = mark;
			return bytes.readUTFBytes(bytes.bytesAvailable);
		}

		/**
		 * 解码为ByteArray
		 * 
		 * @param data 密文
		 * @param output 输出流
		 * @param decharSet 逆字符集
		 * 
		 * @see Base85CharSet#RFC_1924
		 * @see Base85Encoder#encodeByteArray
		 */
		public static function decodeByteArray(data:String, output:IDataOutput, decharSet:Object = null):void {
			decharSet = decharSet ? decharSet : Base85CharSet.DECODE_RFC_1924;
			var dataLength:int = data.length;
			var endbytes:int = dataLength % 5;
			dataLength -= endbytes;
			//decode normal group of bytes
			for(var i:int = 0; i< dataLength;i++) {
				output.writeUnsignedInt(
					decharSet[data.charAt(i)] + 
					decharSet[data.charAt(++i)]*85 + 
					decharSet[data.charAt(++i)]*(85*85) + 
					decharSet[data.charAt(++i)]*(85*85*85) + 
					decharSet[data.charAt(++i)]*(85*85*85*85)
				);
			}
			//decode last group of bytes
			var buf:int;
			switch(endbytes) {
				case 0:
					break;
				case 4:
					buf = 
					(
						decharSet[data.charAt(i)] + 
						decharSet[data.charAt(++i)]*85 + 
						decharSet[data.charAt(++i)]*(85*85) + 
						decharSet[data.charAt(++i)]*(85*85*85)
					);
					if(output.endian == Endian.BIG_ENDIAN) {
						output.writeByte(
							(buf&0xFF0000) >> 16
						);
						output.writeByte(
							(buf&0x00FF00) >> 8
						);
						output.writeByte(
							(buf&0x0000FF)
						);
					} else {
						output.writeByte(
							(buf&0x0000FF)
						);
						output.writeByte(
							(buf&0x00FF00) >> 8
						);
						output.writeByte(
							(buf&0xFF0000) >> 16
						);
					}
					break;
				case 3:
					output.writeShort(
						(
							decharSet[data.charAt(i)] + 
							decharSet[data.charAt(++i)]*85 + 
							decharSet[data.charAt(++i)]*(85*85)
						)
					);
					break;
				default:	//2
					/* buf = 
					(
						decharSet[data.charAt(i)] + 
						decharSet[data.charAt(++i)]*85
					); */
					output.writeByte(
						decharSet[data.charAt(i)] + 
						decharSet[data.charAt(++i)]*85
					);
					break;
			}
		}
	}
}