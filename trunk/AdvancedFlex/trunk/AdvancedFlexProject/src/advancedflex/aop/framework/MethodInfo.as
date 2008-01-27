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
	 * The info of invoked method.<br/>
	 * 被调用的方法的信息。
	 */
	public class MethodInfo {
		
		/**
		 * The invoked method's target.
		 */
		public var target:*;
		
		/**
		 * The invoked method's URI.
		 */
		public var uri:String;
		
		/**
		 * The invoked method's localName.
		 */
		public var name:String;
		
		/**
		 * The Array of invoked method's args.
		 */
		public var args:Array;
		
		/**
		 * The invoked method's result.
		 */
		public var result:*;
		
		/**
		 * Create MethodInfo.<br/>
		 * 创建MethodInfo。
		 * 
		 * @param uri The invoked method's URI.
		 * @param name The invoked method's localName.
		 * @param args The Array of invoked method's args.
		 * @param target The invoked method's target.
		 */
		public function MethodInfo(uri:String, name:String, args:Array, target:*) {
			this.uri = uri;
			this.name = name;
			this.args = args;
			this.target = target;
			result = null;
		}
		
		/**
		 * invoke method
		 * 
		 * @return The result of the method is invoke.
		 */
		public function invoke():* {
			result = target[name].apply(target, args);
			return result;
		}
		
		/**
		 * Clone this instance.
		 * 
		 * @return The copy of this instance.
		 */
		public function clone():MethodInfo {
			var result:MethodInfo = new MethodInfo(uri, name, args.slice(), target);
			result.result = this.result;
			return result;
		}
	}
}