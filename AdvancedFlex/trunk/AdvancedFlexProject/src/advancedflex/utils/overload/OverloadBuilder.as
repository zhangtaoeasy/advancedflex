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
	
	public class OverloadBuilder {
		
		private var $thisObject:Object;
		
		private var $args:Array /* of * */;
		
		private var $argsLength:int;
		
		private static const $instance:OverloadBuilder = new OverloadBuilder();
		
		private var $hasResult:Boolean = false;
		
		private var $result:*;
		
		/* public function OverloadBuilder(thisObject:Object, args:Array) {
			$thisObject = thisObject;
			$args = args;
			$argsLength = $args.length;
		} */
		
		public static function setup(thisObject:Object, args:Array):OverloadBuilder {
			$instance.$thisObject = thisObject;
			$instance.$args = args;
			$instance.$argsLength = args.length;
			$instance.$hasResult = false;
			$instance.$result = null;
			return $instance;
		}
		
		public function tryThis(callback:Function, ...types):OverloadBuilder {
			if(!$hasResult) {
				if(types.length == 0 && $argsLength == 0) {
					$result = callback();
					$hasResult = true;
				}else if(
					(types[types.length-1] == RestArgs && $matchRestArgs(types))
				 	|| $match(types)) 
				{
					$result = callback.apply($thisObject, $args);
					$hasResult = true;
				}
			}
			return this;
		}
		
		public function others(callback:Function):OverloadBuilder {
			if(!$hasResult) {
				$result = callback.apply($thisObject, $args);
				$hasResult = true;
			}
			return this;
		}
		
		public function getResult():* {
			if(!$hasResult)
				throw new ReferenceError("Unknown patterns of param is given.");
			return $result;
		}
		
		private function $matchRestArgs(types:Array):Boolean {
			var length:int = types.length - 1;
			for(var i:int = 0; i < length; i++) {
				if(!($args[i] is types[i]))
					return false;
			}
			return true;
		}
		
		private function $match(types:Array):Boolean {
			var length:int = types.length;
			if(length == $argsLength) {
				for(var i:int = 0; i < length; i++) {
					if(!($args[i] is types[i]))
						return false;
				}
				return true;
			}
			return false;
		}
	}
}