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
package advancedflex.aop.framework {
	
	/**
	 * Abstract AOP advisor.
	 * 
	 * @author Stephen
	 */
	public class Advisor {
		
		/**
		 * 
		 * @param methodInfo
		 * @param joinPoint
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
		
		public function throwing(methodInfo:MethodInfo, error:Error):void {
			throw error;
		}
		
		public function exception(methodInfo:MethodInfo, exception:*):void {
			throw exception;
		}
		
		public function after(methodInfo:MethodInfo):void {
			
		}
	}
}