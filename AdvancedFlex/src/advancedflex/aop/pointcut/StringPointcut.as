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
//文件名		: 
//版本		: 
//简介		: 
//历史
//	YYYY/MM/DD 修改者		内容
//-------------------------------------------------------------------------------
package advancedflex.aop.pointcut {
	
	import advancedflex.aop.framework.Advisor;
	import advancedflex.aop.framework.Pointcut;

	public class StringPointcut extends Pointcut {
		
		private var uri:String;
		
		private var localName:String;
		
		public function StringPointcut(localName:String, v:Advisor=null, uri:String = "") {
			super(v);
			this.uri = uri;
			this.localName = localName
		}
		
		public final override function match(uri:String, localName:String):Boolean {
			return this.localName === localName && this.uri === uri;
		}
	}
}