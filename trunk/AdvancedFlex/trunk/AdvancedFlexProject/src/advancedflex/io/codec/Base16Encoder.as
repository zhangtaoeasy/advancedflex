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
	
	public class Base16Encoder implements IBaseXEncoder{
		
		public function encodeString(src:String, charSet:Array = null):String {
			var bytes:ByteArray = new ByteArray();
			bytes.writeUTFBytes(src);
			bytes.position = 0;
			return encode(bytes, charSet ? charSet : Base16CharSet.RFC_3548);
		}
		
		public function encode(data:ByteArray, charSet:Array = null):String {
			charSet = charSet ? charSet : Base16CharSet.RFC_3548;
			var pos:uint = data.position;
			var result:String = "";
			while(data.bytesAvailable) {
				var buf:uint = data.readUnsignedByte();
				var low:uint = buf & 0xF;
				var high:uint = buf >>> 4;
				result += charSet[high] + charSet[low];
			}
			data.position = pos;
			return result;
		}
	}
}