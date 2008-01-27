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

package advancedflex.math.solving {
	
	/**
	 * 解存在的范围。
	 */
	public class ResultRange {
		
		/**
		* 解存在的范围的最小值。
		*/
		public var min:Number;
		
		/**
		* 解存在的范围的最大值。
		*/
		public var max:Number;
		
		/**
		 * 创建一个 ResultRange 对象。
		 * @param min 解存在的范围的最小值。
		 * @param max 解存在的范围的最大值。
		 */
		public function ResultRange(min:Number, max:Number) {
			this.min = Math.min(min, max);
			this.max = Math.max(min, max);
		}
	}
}