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
//文件名		: IAfterAdvice.as
//版本		: 0.1
//简介		: 
//历史
//	YYYY/MM/DD 修改者		内容
//	2007/08/12 Stephen		Create
//	2007/08/19 Stephen		Change 
//								excute -> after
//-------------------------------------------------------------------------------
package advancedflex.aop.advice {
	
	import advancedflex.aop.framework.MethodInfo;
	
	/**
	 * 
	 */
	public interface IAfterAdvice {
		
		/**
		 * 
		 * @param methodInfo
		 * 
		 */
		function after(methodInfo:MethodInfo):void;
	}
}