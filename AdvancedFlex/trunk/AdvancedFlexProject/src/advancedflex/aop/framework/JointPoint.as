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
//文件名		: JointPoint.as
//版本		: 0.1 beta
//简介		: AOP的切入口
//历史
//	YYYY/MM/DD 修改者		内容
//	2007/07/29 Stephen		创建
//	2007/08/05 Stephen		
//	2007/08/11 Stephen		Add comment
//-------------------------------------------------------------------------------
package advancedflex.aop.framework {
	
	/**
	 * The joint point of AOP framework.<br/>
	 * AOP的切入点。
	 */
	public final class JointPoint {
		
		/**
		 * @private
		 */
		internal var advisor:Advisor;
		
		/**
		 * Create JointPoint.<br/>
		 * 创建一个AOP的切入点。
		 * 
		 * @param advisor Advisor
		 */
		public function JointPoint(advisor:Advisor) {
			this.advisor = advisor;
		}
		
		/**
		 * @private
		 * 
		 * 执行切入点。
		 * 
		 * @param methodInfo The info of invoked method. 被调用的方法的信息。
		 */
		internal function execute(methodInfo:MethodInfo):void {
			advisor.around(methodInfo, this);
		}
		
		/**
		 * Proceeds to the next interceptor in the chain.<br/>
		 * 进入切入点。
		 * 
		 * @param methodInfo The info of invoked method. 被调用的方法的信息。
		 */
		public function proceed(methodInfo:MethodInfo):void {
			try {
				advisor.before(methodInfo);
				methodInfo.invoke();
				advisor.returning(methodInfo);
			} catch(e:Error) {
				advisor.throwing(methodInfo, e);
			} catch(e:*) {
				advisor.exception(methodInfo, e);
			} finally {
				advisor.after(methodInfo);
			}
		}
	}
}