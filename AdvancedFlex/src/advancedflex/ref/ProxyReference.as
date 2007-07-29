package advancedflex.ref {
	import flash.utils.Proxy;

	public class ProxyReference extends Proxy implements IReference {
		private var _target:*;
		public function ProxyReference(target:*) {
			_target = target;
		}
		public function get target():* {
			return _target;
		}
		public function set target(v:*):void {
		 	_target = v;
		}
		flash_proxy override function callProperty(name:*, ...rest):* {
			_target.apply(name, rest);
		}
		flash_proxy override function getProperty(name:*):* {
			return _target[name];
		}
		
		flash_proxy override function setProperty(name:*,value:*):void {
			_target[name] = value;
		}
		
		flash_proxy override function deleteProperty(name:*):Boolean {
			return delete _target[name];
		}
		flash_proxy override function getDescendants(name:*):* {
			return _target.descendants(name);
		}
		flash_proxy override function hasProperty(name:*):Boolean {
			return _target.hasOwnProperty(name);
		}
	}
}