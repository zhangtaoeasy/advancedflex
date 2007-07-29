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
			for each(var i:XML in methods) {
				methodMap[i.@name] = defaultPointcut;
			}
		}
		public override function $addPointcut(pointcut:Pointcut):void {
			for(var i:String in methodMap) {
				if(pointcut.match(i)) {
					methodMap[i] = pointcut;
				}
			}
		}
		flash_proxy override function callProperty(name:*, ...args):* {
			var pointcut:Pointcut = methodMap[name];
			if(!pointcut) {
				throw new ReferenceError("There is no such a method : " + name);
			}
			var methodInfo:MethodInfo = new MethodInfo(name, args, target)
			pointcut.aop::execute(methodInfo);
			return methodInfo.result;
		}
	}
}