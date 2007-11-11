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
package advancedflex.display.images {
	
	import flash.display.BitmapData;
	
	public final class ImageBufferManager {
		
		private static var $bitmapBuf:BitmapDataBag = new BitmapDataBag();
		private static var $tranBitmapBuf:BitmapDataBag = new BitmapDataBag();
		
		public static function offerBuffer(minWidth:int, minHight:int, transparent:Boolean = false):BitmapData {
			if(transparent) {
				return $tranBitmapBuf.pullGt(minWidth, minHight, true);
			}
			return $bitmapBuf.pullGt(minWidth, minHight, false);
		}
		public static function offerFixedBuffer(width:int, hight:int, transparent:Boolean = false):BitmapData {
			if(transparent) {
				return $tranBitmapBuf.pullEq(width, hight, true);
			}
			return $bitmapBuf.pullEq(width, hight, false);
		}
		public static function recycle(buffer:BitmapData):void {
			if(buffer.transparent) {
				$tranBitmapBuf.add(buffer);
			}else{
				$bitmapBuf.add(buffer);
			}
		}
		public static function free():void {
			$tranBitmapBuf.freeAll();
			$bitmapBuf.freeAll();
		}
	}
}