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

package advancedflex.graphics.images {
	
	import advancedflex.math.mapping.IMapping1d;
	
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class ImageNoise {
		
		public static function customColorNoise(
			sourceBitmapData:BitmapData, 
			randomSeed:int,
			sourceRect:Rectangle, 
			colors:Array, 
			pixels:Array, 
			isRatio:Boolean = true
			):int
		{
			if(!sourceBitmapData) {
				throw new ArgumentError("sourceBitmapData is null.");
			}
			if(colors.length != pixels.length) {
				throw new ArgumentError("colors.length != ratios.length.");
			}
			var i:int;
			var length:int = colors.length;
			if(isRatio) {
				var s:int = sourceBitmapData.width * sourceBitmapData.height;
				for(i = 0; i < length; i++) {
					pixels[i] = s*pixels[i];
				}
			}
			var point:Point = new Point(sourceRect.x, sourceRect.y)
			for(i = 0; i < length; i++) {
				randomSeed = sourceBitmapData.pixelDissolve(sourceBitmapData, sourceRect, point, randomSeed, pixels[i], colors[i]);
			}
			return randomSeed;
		}
		public static function mappingNoise(sourceBitmapData:BitmapData, mapping:IMapping1d, randomSeed:int, low:uint = 0, high:uint = 255, channelOptions:uint = 7, grayScale:Boolean = false):void {
			if(!sourceBitmapData) {
				throw new ArgumentError("sourceBitmapData is null.");
			}
			sourceBitmapData.noise(randomSeed, low, high, channelOptions, grayScale);
			var redMap:Array = new Array(256)
			var greenMap:Array = new Array(256)
			var blueMap:Array = new Array(256);
			var tmp:uint;
			for(var i:int = 0; i < 256; i++) {
				tmp = uint( Math.min( Math.max(mapping.getValue(i), 0 ), 255) )
				redMap[i] = ( greenMap[i] = ( blueMap[i] = tmp ) << 8 ) << 8;
			}
			if(!(channelOptions & BitmapDataChannel.RED)) {
				redMap = null;
			}
			if(!(channelOptions & BitmapDataChannel.GREEN)) {
				greenMap = null;
			}
			if(!(channelOptions & BitmapDataChannel.BLUE)) {
				blueMap = null;
			}
			sourceBitmapData.paletteMap(
				sourceBitmapData,
				sourceBitmapData.rect, 
				new Point(0,0),
				redMap,
				greenMap,
				blueMap
			);
		}
	}
}