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

//------------------------------------------------------------------------------
//文件名		: StaticAOPProxy.as
//版本		: 0.2 alpha
//简介		: 
//历史
//	YYYY/MM/DD 修改者		内容
//-------------------------------------------------------------------------------
package advancedflex.aop.proxy {
	
	import advancedflex.aop.framework.AOPProxy;
	import advancedflex.aop.framework.MethodInfo;
	import advancedflex.aop.framework.Pointcut;
	import advancedflex.aop.framework.aop;
	
	import flash.utils.*;
	
	use namespace flash_proxy;
	
	public dynamic class StaticAOPProxy extends AOPProxy {
		
		private var methodMap:Object;
		
		public function StaticAOPProxy(target:*) {
			super(target);
			methodMap = {};
			initMap();
		}
		
		//init map
		private function initMap():void {
			var methods:XMLList = describeType(target).method;
			methodMap = {};
			for each(var i:XML in methods) {
				var uri:String = (i.@uri).toString();
				var localName:String = (i.@name).toString();
				if(!methodMap[uri]) {
					methodMap[uri] = new Dictionary();
				}
				methodMap[uri][localName] = defaultPointcut;
			}
		}
		
		/**
		 * 
		 * @param pointcut
		 * 
		 */
		public override function $addPointcut(pointcut:Pointcut):void {
			for(var uri:String in methodMap) {
				for(var localName:String in methodMap[uri]) {
					if(pointcut.match(uri, localName)) {
						methodMap[uri][localName] = pointcut;
					}
				}
			}
		}
		
		/**
		 * @private
		 */
		flash_proxy override function callProperty(name:*, ...args):* {
			var pointcut:Pointcut;
			var uri:String, localName:String;
			if(name is QName) {//is QName
				uri = name.uri;
				localName = name.localName
				pointcut = methodMap[uri][localName];
			}else{
				uri = "";
				localName = name
				pointcut = methodMap[""][name];
			}
			if(!pointcut) {
				throw new ReferenceError("There is no such a method : " + name);
			}
			var methodInfo:MethodInfo = new MethodInfo(uri, name, args, target);
			pointcut.aop::execute(methodInfo);
			return methodInfo.result;
		}
	}
}