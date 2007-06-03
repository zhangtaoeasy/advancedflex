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
package advancedflex.debugger.aut.framework.errors {
	
	/**
	 * AssertionError
	 * @author Stephen
	 */
	public class AssertionError extends Error {
		
		/**
		 * creat AssertionError
		 * @param message the identifying message
		 */
		public function AssertionError(message:String = "") {
			super(message, 0);
		}
	}
}