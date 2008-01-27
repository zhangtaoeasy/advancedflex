/////////////////////////////////////////////////////////////////////////////
//Copyright 2007 Advanced Flex Project http://code.google.com/p/advancedflex/. 
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
/////////////////////////////////////////////////////////////////////////////
package advancedflex.debugger.errors {
	
	/**
	 * <p>InfiniteLoopError is thrown by infinite-loop.</p>
	 * 
	 * <p>当死循环时抛出</p>
	 * 
	 * @author WeiHe
	 */
	public class InfiniteLoopError extends Error {
		
		/**
		 * <p>Create new instance.</p>
		 * 
		 * <p>创建一个实例。</p>
		 * 
		 * @param message Error Message. 出错信息。
		 */
		public function InfiniteLoopError(message:String="InfiniteLoopError") {
			super(message, 0);
		}
	}
}