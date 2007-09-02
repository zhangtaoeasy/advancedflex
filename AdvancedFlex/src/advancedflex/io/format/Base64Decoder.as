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
    public class Base64Decoder {
        public static function decode(data:String, charSet:String = Base64CharSet.RFC_2045):String {
            // Decode data to ByteArray
            var bytes:ByteArray = decodeToByteArray(data, charSet);
            // Convert to string and return
            return bytes.readUTFBytes(bytes.length);
        }
        public static function decodeToByteArray(data:String, charSet:String = Base64CharSet.RFC_2045):ByteArray {
            // Initialise output ByteArray for decoded data
            var output:ByteArray = new ByteArray();
            // Create data and output buffers
            var dataBuffer:Array = new Array(4);
            var outputBuffer:Array = new Array(3);
            // While there are data bytes left to be processed
            for (var i:uint = 0; i < data.length; i += 4) {
                // Populate data buffer with position of Base64 characters for
                // next 4 bytes from encoded data
                for (var j:uint = 0; j < 4 && i + j < data.length; j++) {
                    dataBuffer[j] = charSet.indexOf(data.charAt(i + j));
                }
                // Decode data buffer back into bytes
                outputBuffer[0] = (dataBuffer[0] << 2) + ((dataBuffer[1] & 0x30) >> 4);
                outputBuffer[1] = ((dataBuffer[1] & 0x0f) << 4) + ((dataBuffer[2] & 0x3c) >> 2);
                outputBuffer[2] = ((dataBuffer[2] & 0x03) << 6) + dataBuffer[3];
                // Add all non-padded bytes in output buffer to decoded data
                for (var k:uint = 0; k < outputBuffer.length; k++) {
                    if (dataBuffer[k+1] == 64) break;
                    output.writeByte(outputBuffer[k]);
                }
            }
            // Rewind decoded data ByteArray
            output.position = 0;
            // Return decoded data
            return output;
        }
    }
}