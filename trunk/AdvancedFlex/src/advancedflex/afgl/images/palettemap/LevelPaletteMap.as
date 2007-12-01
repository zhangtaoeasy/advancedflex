////////////////////////////////////////////////////////////////////////////////
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
package advancedflex.afgl.images.palettemap {
	
	/**
	 * 色阶映射表。
	 */
	public class LevelPaletteMap extends PaletteMap {
		
		private var $low:int, $mid:int, $high:int;
		
		/**
		 * 创建一个LevelPaletteMap对象。
		 * @param low 低色阶。
		 * @param mid 中色阶。
		 * @param high 高色阶。
		 */
		public function LevelPaletteMap(
			low:int = 0, 
			mid:int = 128, 
			high:int = 255) 
		{
			var gamma:Number = Math.log( (mid-low)/(high-low) ) / Math.log(0.5);
			var mapR:Array = [], mapG:Array = [], mapB:Array = [];
			for(var i:int = 0; i < 0x100; i++) {
			    mapB[i] = i < low  ? 	0 : 
			    		  i > high ?	255 : 
			    		  255 * Math.pow((i - low) / (high - low),1 / gamma);
			    mapG[i] = mapB[i] << 8;
			    mapR[i] = mapB[i] << 16;
			}
			super(mapR, mapG, mapB);
		}
		
		public override function clone():PaletteMap {
			return new LevelPaletteMap($low, $mid, $high);
		}
		
	}
}