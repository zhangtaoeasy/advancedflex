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
package advancedflex.errors {
	
	import flash.errors.IllegalOperationError;

	/**
	 * <p>It throws when some call the Abstract method.</p>
	 * <p>当调用抽象方法时抛出。</p>
	 * 
	 * @author Stephen
	 */
	public class AbstractMethodError extends IllegalOperationError {
		
		/**
		 * <p>Create new instance.</p>
		 * <p>创建一个新的实例。</p>
		 * 
		 * @param message error message. 错误信息。
		 */
		public function AbstractMethodError(message:String="") {
			super(message);
		}
	}
}