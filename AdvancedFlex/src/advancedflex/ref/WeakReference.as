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
	
	import flash.utils.Dictionary;
	
	/**
	 * 弱参照
	 * @see advancedflex.ref.Reference
	 */
	public final class WeakReference implements IReference {
		
		/**
		 * @private
		 * 参照对象的保存对象
		 */
		private var _holder:Dictionary;
		
		/**
		 * 创建一个弱参照
		 * @param target 参照对象
		 */
		public function WeakReference(target:*) {
			_holder = new Dictionary(true);
			_holder[target] = null;
		}
		
		/**
		 * 参照对象
		 * @return 参照对象
		 */
		public function get target():* {
			for(var i:* in _holder) {
				return i;
			}
		}
		
		public function set target(v:*):void {
			for(var i:* in _holder) {
				_holder[i] = v;
			}
		}
	}
}