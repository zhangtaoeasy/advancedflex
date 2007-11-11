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
	
	internal class BitmapDataBag {
		[ArrayElementType("flash.display.BitmapData")]
		private var buf:Array;
		public function BitmapDataBag() {
			buf = new Array();
		}
		internal function add(o:BitmapData):void {
			buf.push(o);
		}
		internal function pullIndex(i:int):BitmapData {
			var result:BitmapData = buf[i];
			buf[i] = buf[buf.length-1];
			buf.pop();
			result.lock();
			return result;
		}
		internal function pullGt(w:int, h:int, transparent:Boolean):BitmapData {
			var result:BitmapData;
			var area:int;
			var area2:int;
			var index:int;
			var length:int = buf.length;
			for(var i:int = 0;i<length; i++) {
				var v:BitmapData = buf[i];
				if(v.width>=w && v.height>=h) {
					if(!result) {
						result = v;
						area = v.width * v.height;
						index = i;
						continue;
					}
					area2 = v.width*v.height
					if(area >= area2) {
						result = v;
						area = area2;
						index = i;
					}
				}
			}
			if(!result) {
				result = new BitmapData(w, h, transparent);
				result.lock();
				return result;
			}
			return pullIndex(index);
		}
		internal function pullEq(w:int, h:int, transparent:Boolean):BitmapData {
			var length:int = buf.length;
			for(var i:int = 0;i<length; i++) {
				var v:BitmapData = buf[i];
				if(v.width==w && v.height==h) {
					return pullIndex(i);
				}
			}
			var result:BitmapData = new BitmapData(w, h, transparent);
			result.lock();
			return result;
		}
		internal function freeAll():void {
			for each(var v:BitmapData in buf) {
				v.dispose();
			}
			buf = new Array();
		}
	}
}