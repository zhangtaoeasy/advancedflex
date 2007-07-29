package {

	
	import advancedflex.aop.framework.AOPProxy;
	import advancedflex.aop.framework.Advisor;
	import advancedflex.aop.framework.Pointcut;
		
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Transform;
	import flash.utils.Dictionary;
	import advancedflex.aop.proxy.StaticAOPProxy;
	import advancedflex.aop.pointcut.StringPointcut;
	import advancedflex.aop.advisor.InvocationAdvisor;
	import advancedflex.aop.framework.MethodInfo;
	import advancedflex.aop.framework.JointPoint;
	import advancedflex.aop.pointcut.RegExpPointcut;
	[SWF(width="640", height="480")]
	public class AdvancedFlex extends Sprite
	{
		public function AdvancedFlex()
		{
			Advisor
			Pointcut
			AOPProxy
			//
			/* g = graphics;
			var arr:Array = new Array(8);
			var temp:Array;
			for(var i:int = 0; i<8; i++) {
				temp = arr[i] = new Array(8);
				for(var j:int = 0; j<8; j++) {
					temp[j] = int.MAX_VALUE;
				}
			}
			trace(arr.join("\n"));
			f(arr, 3, 3, 0);
			trace(arr.join("\n")); */
			var s:Point = new Point(0,0);
			var p:AOPProxy = new StaticAOPProxy(s);
			var ad:InvocationAdvisor = new InvocationAdvisor();
			ad.aroundAdvice = function(method:MethodInfo, join:JointPoint):void {
				trace("#begin","name :", method.name,"args :", method.args, "result :", method.result);
				join.proceed(method);
				trace("@end","name :", method.name,"args :", method.args, "result :", method.result);
			}
			ad.beforeAdvice = function(method:MethodInfo):void {
				trace("@before","name :", method.name,"args :", method.args, "result :", method.result);
			}
			ad.returningAdvice = function(method:MethodInfo):void {
				trace("@return","name :", method.name,"args :", method.args, "result :", method.result);
			}
			ad.throwingAdvice = function(method:MethodInfo, e:Error):void {
				trace("@throw","name :", method.name,"args :", method.args, "result :", method.result);
			}
			ad.afterAdvice = function(method:MethodInfo):void {
				trace("@after","name :", method.name,"args :", method.args, "result :", method.result);
			}
			var pc:Pointcut = new RegExpPointcut(/ad+/, ad);
			p.$addPointcut(pc);
			trace(p.add(new Point(2,3)));
		}
		private var g:Graphics;
		
		private function f(arr:Array, x:int, y:int, distance:int):void {
			try{
				if(arr[y][x] > distance) {
					arr[y][x] = distance;
					distance++;
					f(arr, x+1, y+2, distance);
					f(arr, x+2, y+1, distance);
					f(arr, x-1, y+2, distance);
					f(arr, x-2, y+1, distance);
					f(arr, x+1, y-2, distance);
					f(arr, x+2, y-1, distance);
					f(arr, x-1, y-2, distance);
					f(arr, x-2, y-1, distance);
				}
			} catch(e:Error) {
				
			}
		}
		
	}
}
