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
	import flash.utils.IDataInput;
	
	/**
	 * Base85的编码器
	 * <p>他把4个字节的2进制数据转换为5个字节的文本数据。数据的增加度为25%。</p>
	 * 
	 * @see Base85CharSet
	 * @see Base85Decoder
	 */
	public class Base85Encoder implements IBaseXEncoder{
		/**
		 * 用String来编码
		 * 
		 * @param src 原文
		 * @param charSet Base85字符集，默认为 Base85CharSet.RFC_1924
		 * @return 密文（原文编码后的数据）
		 * 
		 * @see Base85CharSet#RFC_1924
		 */
		public function encodeString(src:String, charSet:Array = null):String {
			// Convert string to ByteArray
			var bytes:ByteArray = new ByteArray();
			bytes.writeUTFBytes(src);
			bytes.position = 0;
			return encodeByteArray(bytes, charSet ? charSet : Base85CharSet.RFC_1924);
		}
		
		/**
		 * 用ByteArray来编码
		 * @param data 原文的输入流
		 * @param charSet Base85字符集，默认为 Base85CharSet.RFC_1924
		 * @return 密文（原文编码后的数据）
		 * 
		 * @see Base85CharSet#RFC_1924
		 */
		public function encode(data:IDataInput, charSet:Array = null):String {
			charSet = charSet ? charSet : Base85CharSet.RFC_1924;
			// Initialise output
			var output:String = "";						//output
			var srcLength:int = data.bytesAvailable;	//length of normal bytes
			var endbytes:int = srcLength % 4;			//length of extra bytes.
			var buf:uint;								//encode buffer
			
			//set this var to correct value.(normal = all - extra)
			srcLength -= endbytes;
			
			//encode normal group of bytes
			for(var i:int = 0; i < srcLength; i+=4) {
				buf = data.readUnsignedInt();
				output += charSet[buf % 85];
				buf /= 85;
				output += charSet[buf % 85];
				buf /= 85;
				output += charSet[buf % 85];
				buf /= 85;
				output += charSet[buf % 85];
				buf /= 85;
				output += charSet[buf % 85];
			}
			
			//encode last group of bytes
			buf = 0;
			for(var j:int = 0; j < endbytes; j++) {
				buf = (buf << 8) | data.readByte();
			}
			switch(endbytes) {
				case 0:		//no extra byte
					break;
				case 3:		//has 3 extra bytes
					output += charSet[buf % 85];
					buf /= 85;
				case 2:		//has 2 extra bytes
					output += charSet[buf % 85];
					buf /= 85;
				default:	//has 1 extra byte
					output += charSet[buf % 85];
					buf /= 85;
					output += charSet[buf % 85];
			}
			return output;
		}
	}
}