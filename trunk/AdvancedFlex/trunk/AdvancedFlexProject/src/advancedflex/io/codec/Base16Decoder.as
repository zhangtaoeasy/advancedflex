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
	import flash.utils.IDataOutput;
	
	public class Base16Decoder implements IBaseXDecoder {
		
		public function decodeString(src:String, charSet:Object = null):String {
			var bytes:ByteArray = new ByteArray();
			decode(src, bytes, charSet ? charSet : Base16CharSet.DECODE_RFC_35488);
			bytes.position = 0;
			return bytes.readUTFBytes(bytes.bytesAvailable);
		}

		public function decode(data:String, output:IDataOutput, charSet:Object = null):void {
			if(charSet) {
				charSet = Base16CharSet.DECODE_RFC_35488;
			}
			var length:int = data.length;
			for(var i:int = 0; i < length; i++/* i += 2 */) {
				var buf:int = charSet[data.charAt(i)] << 4;
				i++;// i -> i+1
				buf |= charSet[data.charAt(i)];
				output.writeByte(buf);
			}
		}
	}
}