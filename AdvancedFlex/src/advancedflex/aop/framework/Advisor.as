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
//文件名		: advancedflex/aop/framework/Advisor.as
//版本		: 0.1.1 alpha
//简介		: Advisor的抽象类。
//历史
//	YYYY/MM/DD 修改者		内容
//	2007/07/29 Stephen		创建
//	2007/08/05 Stephen		添加exception
//	2007/08/12 Stephen		Add comment
//-------------------------------------------------------------------------------
package advancedflex.aop.framework {
	
	/**
	 * Abstract AOP advisor.<br/>
	 * 抽象的AOP advisor。
	 */
	public class Advisor {
		
		/**
		 * Callback around a given method.
		 * 在进入切入点周围执行。
		 * 
		 * @param methodInfo Info of given method. 调用方法的信息。
		 * @param jointPoint Joint Point 切入点
		 */
		public function around(methodInfo:MethodInfo, jointPoint:JointPoint):void {
			jointPoint.proceed(methodInfo);
		}
		
		/**
		 * Callback before a given method is invoked.<br/>
		 * 在JointPoint前执行。
		 * 
		 * @param methodInfo Info of given method. 调用方法的信息。
		 */
		public function before(methodInfo:MethodInfo):void {
			
		}
		
		/**
		 * Callback after a given method successfully returned.<br/>
		 * 在JointPoint成功返回后执行。
		 * 
		 * @param methodInfo Info of given method. 调用方法的信息。
		 */
		public function returning(methodInfo:MethodInfo):void {
			
		}
		
		/**
		 * Callback after a given method throwing an Error.<br/>
		 * 在JointPoint抛出错误后执行。
		 * 
		 * @param methodInfo Info of given method. 调用方法的信息。
		 * @param error The Error that given method throws.
		 */
		public function throwing(methodInfo:MethodInfo, error:Error):void {
			throw error;
		}
		
		/**
		 * Callback after a given method throwing any Object except Error.<br/>
		 * 在JointPoint抛出非Error的对象后执行。
		 * 
		 * @param methodInfo Info of given method. 调用方法的信息。
		 * @param exception The Object that given method throws.
		 * 
		 */
		public function exception(methodInfo:MethodInfo, exception:*):void {
			throw exception;
		}
		
		/**
		 * Callback after a given method.Even if it is success or failure.<br/>
		 * 在JointPoint后执行，无论成功与否。
		 * 
		 * @param methodInfo Info of given method. 调用方法的信息。
		 */
		public function after(methodInfo:MethodInfo):void {
			
		}
	}
}