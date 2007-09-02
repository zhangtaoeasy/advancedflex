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
//文件名		: advancedflex/aop/framework/AOPProxy.as
//版本		: 0.1.1 alpha
//简介		: 抽象的AOP代理类
//历史
//	YYYY/MM/DD 修改者		内容
//	2007/07/29 Stephen		创建
//	2007/08/05 Stephen		实装
//-------------------------------------------------------------------------------
package advancedflex.aop.framework {
	
	import advancedflex.aop.pointcut.DefaultPointcut;
	import advancedflex.errors.AbstractMethodError;
	
	import flash.utils.*;
	
	use namespace flash_proxy;
	
	/**
	 * The abstract class of AOP proxy.
	 * 抽象的AOP代理类
	 */
	public dynamic class AOPProxy extends Proxy {
		
		/**
		 * Default pointcut.It does nothing.<br/>
		 * 默认的Pointcut。
		 */
		protected static const defaultPointcut:Pointcut = new DefaultPointcut();
		
		/**
		 * 被截取的目标。
		 */
		protected var target:*;
		
		/**
		 * 
		 * @param target
		 * @return 
		 * 
		 */
		public function AOPProxy(target:*) {
			super();
			this.target = target;
		}
		
		/**
		 * 
		 * @param pointcut
		 * 
		 */
		public function $addPointcut(pointcut:Pointcut):void {
			throw new AbstractMethodError();
		}
		
		/**
		 * @private
		 */
		flash_proxy override function callProperty(name:*, ...args):* {
			throw new AbstractMethodError();
		}
		
		/**
		 * @private
		 */
		flash_proxy override function deleteProperty(name:*):Boolean {
			return delete target[name];
		}
		
		/**
		 * @private
		 */
		flash_proxy override function getDescendants(name:*):* {
			return target.descendants(name);
		}
		
		/**
		 * @private
		 */
		flash_proxy override function getProperty(name:*):* {
			return target[name];
		}
		
		/**
		 * @private
		 */
		flash_proxy override function setProperty(name:*, value:*):void {
			target[name] = value;
		}
		
		/**
		 * @private
		 */
		flash_proxy override function hasProperty(name:*):Boolean {
			return target.hasOwnProperty(name);
		}
		
		/**
		 * @private
		 */
		flash_proxy override function isAttribute(name:*):Boolean {
			return !(target[name] is Function);
		}
		
		/**
		 * @private
		 */
		protected var _item:Array; // array of object's properties
		
		/**
		 * @private
		 */
		flash_proxy override function nextNameIndex (index:int):int {
			if (index == 0) {
				_item = new Array();
				for (var x:* in target) {
					_item.push(x);
				}
			}
			
			if (index < _item.length) {
				return index + 1;
			} else {
				return 0;
			}
		}
		
		/**
		 * @private
		 */
		flash_proxy override function nextName(index:int):String {
			return _item[index - 1];
		}
		
		/**
		 * @private
		 */
		flash_proxy override function nextValue(index:int):* {
			return target[_item[index - 1]];
		}
	}
}