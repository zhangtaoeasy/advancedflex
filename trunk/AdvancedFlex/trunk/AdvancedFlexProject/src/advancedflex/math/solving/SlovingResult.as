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
	 * 函数的解。
	 */
	public class SlovingResult {
		
		/**
		* 解。
		*/
		public var result:Number;
		
		/**
		* 多个解(如果有的话)。
		*/
		public var multResult:Array;
		
		/**
		* 误差。
		*/
		public var error:Number;
		
		/**
		* 是否有多个解。
		*/
		public var hasMultResult:Boolean = false;
		
		/**
		 * 创建一个 SlovingResult 对象。
		 * @param result 解，可以为 Number 或 Array(Array 表示多个解)。
		 * @param error 误差。
		 */
		public function SlovingResult(result:*, error:Number) {
			if(result is Array) {
				if(result.length > 1) {
					multResult = result;
					this.result = multResult[0];
					hasMultResult = true;
				}else{
					this.result = result[0];
				}
			}else{
				this.result = result;
			}
		}
	}
}