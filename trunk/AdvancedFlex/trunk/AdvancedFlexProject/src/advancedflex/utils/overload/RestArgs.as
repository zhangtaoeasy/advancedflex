////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2007-2008 Advanced Flex Project 
//                          http://advancedflex.googlecode.com/. 
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

package advancedflex.utils.overload {
	
	import flash.errors.IllegalOperationError;
	
	/**
	 * It defines a type that matchs the "...(rest)" type in Overload Framework.
	 */
	public class RestArgs {
		
		/**
		 * @private
		 * Can't create instance.
		 */
		public function RestArgs() {
			throw new IllegalOperationError("Can't create the instance of this class.");
		}
	}
}