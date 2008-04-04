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
	
	/**
	 * 
	 */
	public final class OverloadSupport {
		
		/**
		 * 
		 */
		private var $map:Array;
		
		
		/**
		 * 
		 */
		private var $defaultFunctionName:String;
		
		/**
		 * 
		 * 
		 */
		public function OverloadSupport() {
			$map = [null];
		}
		
		/**
		 * 
		 * @param defaultFunction
		 * @return 
		 * 
		 */
		public function setDefault(defaultFunctionName:String):OverloadSupport {
			$defaultFunctionName = defaultFunctionName;
			return this;
		}
		
		/**
		 * 
		 * @param func
		 * @param types
		 * @return 
		 * 
		 */
		public function register(functionName:String, ...types):OverloadSupport {
			if(functionName != null) {
				if(types.length == 0) {
					$map[0] = functionName;
				}else{
					putTypes(types, functionName);
				}
				return this;
			}
			throw new ArgumentError("Param:<func> must not be null.");
		}
		
		/**
		 * 
		 * @param thisObject
		 * @param args
		 * @return 
		 * 
		 */
		use namespace overload;
		public function invoke(thisObject:Object, args:Array):* {
			return (thisObject.overload::[$getFunctionName(args)]).apply(thisObject, args);
		}
		
		/**
		 * 
		 * @param types
		 * @param func
		 * 
		 */
		private function putTypes(types:Array, functionName:String):void {
			var length:int = types.length;
			var typesArray:Array = [];
			for(var i:int = 0; i < length; i++) {
				var type:Class = types[i];
				typesArray.push(type);
			}
			if(types[length-1] == RestArgs) {
				typesArray.restArgs = true;
				typesArray.pop();
			}
			typesArray.push(functionName);
			$map.push(typesArray);
		}
		
		/**
		 * 
		 * @param args
		 * @return 
		 * 
		 */
		private function $getFunctionName(args:Array):String {
			var argsLength:int = args.length;
			if(argsLength == 0) {
				if($map[0] != null)
					return $map[0];
				throw new TypeError("No pattern matched.");
			}
			var mapLength:int = $map.length;
			
			var point:Array;
			var j:int;
			var arg:*;
			out:for(var i:int = 1; i < mapLength; i++) {
				point = $map[i];
				if(argsLength == point.length-1) {
					for(j = 0; j < argsLength; j++) {
						arg = args[j];
						if(arg != null && !(arg is point[j])) {
							continue out;
						}
					}
					return point[argsLength];
				}else if(point.restArgs) {
					var pointLength:int = point.length - 1;
					for(j = 0; j < pointLength; j++) {
						arg = args[j];
						if(arg != null && !(arg is point[j])) {
							continue out;
						}
					}
					return point[pointLength];
				}
			}
			if($defaultFunctionName != null) {
				return $defaultFunctionName;
			}
			throw new TypeError("No pattern matched.");
		}
	}
}