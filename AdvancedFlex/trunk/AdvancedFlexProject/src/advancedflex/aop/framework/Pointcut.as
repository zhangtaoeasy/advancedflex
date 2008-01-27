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
//文件名		: Pointcut.as
//版本		: 0.1 alpha
//简介		: Pointcut的抽象类
//历史
//	YYYY/MM/DD 修改者		内容
//-------------------------------------------------------------------------------
package advancedflex.aop.framework {
	
	import advancedflex.errors.AbstractMethodError;
	
	use namespace aop;
	
	/**
	 * 
	 * @author WeiHe
	 * 
	 */
	public class Pointcut {
		
		/**
		* @private
		*/
		internal var jointPoint:JointPoint;
		
		/**
		 * 
		 * @param v
		 * @return 
		 * 
		 */
		public function Pointcut(v:Advisor = null) {
			jointPoint = new JointPoint(v);
		}
		
		/**
		 * 
		 * @param uri
		 * @param localName
		 * @return 
		 * 
		 */
		public function match(uri:String, localName:String):Boolean {
			throw new AbstractMethodError("Pointcut class is an Abstract class.");
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get advisor():Advisor {
			return jointPoint.advisor;
		}
		
		/**
		 * 
		 * @param v
		 * 
		 */
		public function set advisor(v:Advisor):void {
			jointPoint.advisor = v;
		}
		
		/**
		 * @private
		 */
		aop function execute(methodInfo:MethodInfo):void {
			jointPoint.execute(methodInfo);
		}
	}
}