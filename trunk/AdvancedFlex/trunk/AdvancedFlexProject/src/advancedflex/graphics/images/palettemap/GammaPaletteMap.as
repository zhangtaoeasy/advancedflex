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

package advancedflex.graphics.images.palettemap {
	
	public class GammaPaletteMap extends PaletteMap {
		
		private var $gamma:Number;
		
		public function get gamma():Number {
			return $gamma;
		}
		
		public function set gamma(v:Number):void {
			resetGamma(v);
		}
		
		public function GammaPaletteMap(gamma:Number) {
			super();
			resetGamma(gamma);
		}
		
		public override function clone():PaletteMap {
			return new GammaPaletteMap($gamma);
		}
		
		protected function resetGamma(gamma:Number):void {
			$checkGamma(gamma);
			$gamma = gamma;
			var redArray:Array = redMap || new Array(256);
			var greenArray:Array = greenMap || new Array(256);
			var blueArray:Array = blueMap || new Array(256);
			
			for(var i:int = 0; i < 0x100; i++) {
			    blueArray[i] = 255 * Math.pow(i / 255, 1 / gamma);
			    greenArray[i] = blueArray[i] << 8;
			    redArray[i] = blueArray[i] << 16;
			}
			reset(redArray, greenArray, blueArray);
		}
		
		private function $checkGamma(g:Number):void {
			if(g<=0) {
				throw new ArgumentError("Gamma must be greater than 0.")
			}
		}
	}
}