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
	import flash.utils.*;
	
	use namespace flash_proxy;

	/**
	 * 
	 * @author WeiHe
	 * 
	 */
	public class ProxyReference extends Proxy implements IReference {
		
		/**
		 * @private
		 * 参照对象
		 */
		private var _target:*;
		
		/**
		 * 
		 * @param target
		 * @return 
		 * 
		 */
		public function ProxyReference(target:*) {
			_target = target;
		}
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get target():* {
			return _target;
		}
		
		/**
		 * 
		 * @param v
		 * 
		 */
		public function set target(v:*):void {
		 	_target = v;
		}
		
		flash_proxy override function callProperty(name:*, ...rest):* {
			_target.apply(name, rest);
		}
		
		flash_proxy override function getProperty(name:*):* {
			return _target[name];
		}
		
		flash_proxy override function setProperty(name:*,value:*):void {
			_target[name] = value;
		}
		
		flash_proxy override function deleteProperty(name:*):Boolean {
			return delete _target[name];
		}
		
		flash_proxy override function getDescendants(name:*):* {
			return _target.descendants(name);
		}
		
		flash_proxy override function hasProperty(name:*):Boolean {
			return _target.hasOwnProperty(name);
		}
	}
}