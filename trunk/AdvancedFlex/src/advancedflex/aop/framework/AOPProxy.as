package advancedflex.aop.framework {
	
	import flash.utils.*;
	import advancedflex.errors.AbstractMethodError;
	
	use namespace flash_proxy;
	
	public dynamic class AOPProxy extends Proxy {
		protected static const defaultPointcut:Pointcut = new DefaultPointcut();
		
		protected var target:*;
		
		public function AOPProxy(target:*) {
			super();
			this.target = target;
		}
		public function $addPointcut(pointcut:Pointcut):void {
			throw new AbstractMethodError();
		}
		flash_proxy override function callProperty(name:*, ...args):* {
			throw new AbstractMethodError();
		}
		flash_proxy override function deleteProperty(name:*):Boolean {
			return delete target[name];
		}
		flash_proxy override function getDescendants(name:*):* {
			return target.descendants(name);
		}
		flash_proxy override function getProperty(name:*):* {
			return target[name];
		}
		flash_proxy override function setProperty(name:*, value:*):void {
			target[name] = value;
		}
		flash_proxy override function hasProperty(name:*):Boolean {
			return target.hasOwnProperty(name);
		}
		flash_proxy override function isAttribute(name:*):Boolean {
			return !(target[name] is Function);
		}
		protected var _item:Array; // array of object's properties
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
		flash_proxy override function nextName(index:int):String {
			return _item[index - 1];
		}
		flash_proxy override function nextValue(index:int):* {
			return target[_item[index - 1]];
		}
		
	}
}