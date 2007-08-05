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
//文件名		: RegExpPointcut.as
//版本		: 0.2 alpha
//简介		: 用RegExp来匹配的Pointcut。
//历史
//	YYYY/MM/DD 修改者		内容
//	2007/07/30 Stephen		创建。
//	2007/08/05 Stephen		修改构造函数与match的参变量，让它能支持QName。
//-------------------------------------------------------------------------------
package advancedflex.aop.pointcut {
	
	import advancedflex.aop.framework.Advisor;
	import advancedflex.aop.framework.Pointcut;

	/**
	 * 
	 * 用RegExp来匹配的Pointcut。
	 */
	public class RegExpPointcut extends Pointcut {
		
		//The pattern of invoked method's name.
		private var localNamePattern:RegExp;
		
		//The pattern of invoked method's URI.
		private var uriPattern:RegExp;
		
		//Can matches all URI's RegExp.
		private static const DEFAUL_URI:RegExp = /.*/;
		
		/**
		 * Create RegExpPointcut.<br/>
		 * 创建RegExpPointcut。
		 * @param uri The pattern of invoked method's URI. URI的模板。
		 * @param localName The pattern of invoked method's name. 被调用的方法名的模板。
		 * @param advisor 
		 */
		public function RegExpPointcut(uri:RegExp, localName:RegExp, advisor:Advisor = null) {
			super(advisor);
			uriPattern = uri ? uri : DEFAUL_URI;
			localNamePattern = localName;
		}
		
		/**
		 * Check if given method matchs this Pointcut.<br/>
		 * 检测给予的方法是否匹配本Pointcut。
		 * @param uri Invoked method's URI. 被调用的方法的URI
		 * @param localName Invoked method's name. 被调用的方法名。
		 * @return true if matches. 如果匹配的话返回true，否则为false。
		 */
		public final override function match(uri:String, localName:String):Boolean {
			var resultLocalName:* = localNamePattern.exec(localName);
			if(resultLocalName && resultLocalName[0] === localName) {
				var resultURI:* = uriPattern.exec(uri);
				if(resultURI && resultURI[0] === uri) {
					return true;
				}
			}
			return false;
		}
	}
}