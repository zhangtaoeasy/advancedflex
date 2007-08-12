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
//文件名		: MethodInfo
//版本		: 0.2 beta
//简介		: 描述方法的信息
//历史
//	YYYY/MM/DD 修改者		内容
//	2007/07/29 Stephen		创建
//	2007/08/05 Stephen		实现
//	2007/08/11 Stephen		添加 var uri:String;
//							修改 var name:*; -> var name:String;
//							    MethodInfo(name:*... -> MethodInfo(uri:String, name:String...
//-------------------------------------------------------------------------------
package advancedflex.aop.framework {
	
	/**
	 * 
	 * @author WeiHe
	 * 
	 */
	public class MethodInfo {
		
		/**
		* 
		*/
		public var target:*;
		
		/**
		* 
		*/
		public var uri:String;//Add 2007/08/11
		
		/**
		* 
		*/
		public var name:String;//Change 2007/08/11 (var name:*; -> var name:String;)
		
		/**
		* 
		*/
		public var args:Array;
		
		/**
		* 
		*/
		public var result:*;
		
		/**
		 * 
		 * @param name
		 * @param args
		 * @param target
		 * @return 
		 * 
		 */
		public function MethodInfo(uri:String, name:String, args:Array, target:*) {
				//Change 2007/08/11 (...name:*... -> ...uri:String, name:String...)
			this.uri = uri;//Add 2007/08/11
			this.name = name;
			this.args = args;
			this.target = target;
			result = null;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function invoke():* {
			result = target[name].apply(target, args);
			return result;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function clone():MethodInfo {
			var result:MethodInfo = new MethodInfo(uri, name, args.slice(), target);
				//Change 2007/08/11 ( ...(name... -> ...(uri, name... )
			result.result = this.result;
			return result;
		}
	}
}