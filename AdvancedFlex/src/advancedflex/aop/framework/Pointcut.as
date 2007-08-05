package advancedflex.aop.framework {
	import advancedflex.errors.AbstractMethodError;
	use namespace aop;
	public class Pointcut {
		internal var jointPoint:JointPoint;
		public function Pointcut(v:Advisor = null) {
			jointPoint = new JointPoint(v);
		}
		public function match(uri:String, localName:String):Boolean {
			throw new AbstractMethodError("Pointcut class is an Abstract class.");
		}
		public function get advisor():Advisor {
			return jointPoint.advisor;
		}
		public function set advisor(v:Advisor):void {
			jointPoint.advisor = v;
		}
		aop function execute(methodInfo:MethodInfo):void {
			jointPoint.execute(methodInfo);
		}
	}
}