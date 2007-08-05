package advancedflex.aop.proxy
{
	import advancedflex.aop.framework.AOPProxy;
	import advancedflex.aop.framework.MethodInfo;
	import advancedflex.aop.framework.Pointcut;
	import advancedflex.aop.framework.aop;
	import flash.utils.*;
	use namespace flash_proxy;
	public dynamic class StaticAOPProxy extends AOPProxy
	{
		
		private var methodMap:Object;
		public function StaticAOPProxy(target:*)
		{
			super(target);
			methodMap = {};
			initMap();
		}
		private function initMap():void {
			var methods:XMLList = describeType(target).method;
			methodMap = {};
			for each(var i:XML in methods) {
				var uri:String = (i.@uri).toString();
				var localName:* = (i.@name).toString();
				if(!methodMap[uri]) {
					methodMap[uri] = new Dictionary();
				}
				methodMap[uri][localName] = defaultPointcut;
			}
		}
		public override function $addPointcut(pointcut:Pointcut):void {
			for(var uri:String in methodMap) {
				for(var localName:String in methodMap[uri]) {
					if(pointcut.match(uri, localName)) {
						methodMap[uri][localName] = pointcut;
					}
				}
			}
		}
		flash_proxy override function callProperty(name:*, ...args):* {
			var pointcut:Pointcut;
			if(name is QName) {
				pointcut = methodMap[name.uri][name.localName];
			}else{
				pointcut = methodMap[""][name];
			}
			if(!pointcut) {
				throw new ReferenceError("There is no such a method : " + name);
			}
			var methodInfo:MethodInfo = new MethodInfo(name, args, target)
			pointcut.aop::execute(methodInfo);
			return methodInfo.result;
		}
	}
}