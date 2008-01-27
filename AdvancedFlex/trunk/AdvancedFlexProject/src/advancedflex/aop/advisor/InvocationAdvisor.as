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
//文件名		: InvocationAdvisor.as
//版本		: 0.1 beta
//简介		: 以Function为参数的Advisor。
//历史
//	YYYY/MM/DD 修改者		内容
//	2007/08/05 Stephen		创建
//	2007/08/12 Stephen		添加注释
//-------------------------------------------------------------------------------
package advancedflex.aop.advisor {
	
	import advancedflex.aop.framework.Advisor;
	import advancedflex.aop.framework.JointPoint;
	import advancedflex.aop.framework.MethodInfo;

	/**
	 * The Advisor that uses function to implement.
	 * It makes easier to build Advisor than to extend class of Advisor.<br/>
	 * 以Function为参数的Advisor。
	 * @author WeiHe
	 * 
	 */
	public class InvocationAdvisor extends Advisor {
		
		/**
		 * Around Advice.
		 * The function args must be:
		 * <code>function around(methodInfo:MethodInfo, jointPoint:JointPoint):void;</code>
		 */
		public var aroundAdvice:Function;
		
		/**
		 * Before Advice.
		 * The function args must be:
		 * <code>function before(methodInfo:MethodInfo):void;</code>
		 */
		public var beforeAdvice:Function;
		
		/**
		 * Returning Advice.
		 * The function args must be:
		 * <code>function returning(methodInfo:MethodInfo):void;</code>
		 */
		public var returningAdvice:Function;
		
		/**
		 * Throwing Advice.
		 * The function args must be:
		 * <code>function throwing(methodInfo:MethodInfo, error:Error):void;</code>
		 */
		public var throwingAdvice:Function;
		
		/**
		 * Exception Advice.
		 * The function args must be:
		 * <code>function exception(methodInfo:MethodInfo, exception:*):void;</code>
		 */
		public var exceptionAdvice:Function;
		
		/**
		 * After Advice.
		 * The function args must be:
		 * <code>function after(methodInfo:MethodInfo):void</code>
		 */
		public var afterAdvice:Function;
		
		/**
		 * @private
		 */
		public override function around(methodInfo:MethodInfo, jointPoint:JointPoint):void {
			if(!(aroundAdvice)) {
				jointPoint.proceed(methodInfo);
			} else {
				aroundAdvice(methodInfo, jointPoint);
			}
		}
		
		/**
		 * @private
		 */
		public override function before(methodInfo:MethodInfo):void {
			if(beforeAdvice != null) {
				beforeAdvice(methodInfo);
			}
		}
		
		/**
		 * @private
		 */
		public override function returning(methodInfo:MethodInfo):void {
			if(returningAdvice != null) {
				returningAdvice(methodInfo);
			}
		}
		
		/**
		 * @private
		 */
		public override function throwing(methodInfo:MethodInfo, error:Error):void {
			if(!(beforeAdvice)) {
				throw error;
			} else {
				throwingAdvice(methodInfo, error);
			}
		}
		
		/**
		 * @private
		 */
		public override function exception(methodInfo:MethodInfo, exception:*):void {
			if(!(beforeAdvice)) {
				throw exception;
			} else {
				exceptionAdvice(methodInfo, exception);
			}
		}
		
		/**
		 * @private
		 */
		public override function after(methodInfo:MethodInfo):void {
			if(returningAdvice != null) {
				afterAdvice(methodInfo);
			}
		}
	}
}