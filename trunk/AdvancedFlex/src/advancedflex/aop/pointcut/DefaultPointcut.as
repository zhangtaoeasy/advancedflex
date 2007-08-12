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
//文件名		: DefaultPointcut.as
//版本		: 0.2 beta
//简介		: 默认的Pointcut。
//历史
//	YYYY/MM/DD 修改者		内容
//	2007/08/05 Stephen		创建
//	2007/08/11 Stephen		更改包(advancedflex.aop.framework -> advancedflex.aop.pointcut)
//-------------------------------------------------------------------------------
package advancedflex.aop.pointcut {
	
	import advancedflex.aop.framework.Advisor;
	import advancedflex.aop.framework.Pointcut;

	/**
	 * The default pointcut.
	 * It can match all names.<br/>
	 * 默认的Pointcut。
	 */
	public class DefaultPointcut extends Pointcut {
		
		/**
		 * Create DefaultPointcut.<br/>
		 * 创建DefaultPointcut。
		 */
		public function DefaultPointcut() {
			super(new Advisor());
		}
		
		/**
		 * Check if given method matchs this Pointcut.It alwats returns true.<br/>
		 * 检测给予的方法是否匹配本Pointcut。它只会返回true。
		 * 
		 * @param uri Invoked method's URI. 被调用的方法的URI
		 * @param localName Invoked method's name. 被调用的方法名。
		 * 
		 * @return true
		 */
		public override function match(uri:String, localName:String):Boolean {
			return true;
		}
	}
}