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
package advancedflex.ref {
	
	/**
	 * 强参照（普通的参照）
	 * @see advancedflex.ref.WeakReference
	 */
	public final class Reference implements IReference {
		
		/**
		 * @private
		 * 参照对象
		 */
		private var _target:*;
		
		/**
		 * 创建一个强参照
		 * @param target 参照对象
		 */
		public function Reference(target:*) {
			_target = target;
		}
		
		/**
		 * 参照对象
		 * @return 参照对象
		 */
		public function get target():* {
			return _target;
		}
		
		public function set target(v:*):void {
		 	_target = v;
		}
	}
}