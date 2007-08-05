package advancedflex.aop.pointcut
{
	import advancedflex.aop.framework.Advisor;
	import advancedflex.aop.framework.Pointcut;

	public class StringPointcut extends Pointcut
	{
		private var uri:String;
		private var localName:String;
		public function StringPointcut(localName:String, v:Advisor=null, uri:String = "") {
			super(v);
			this.uri = uri;
			this.localName = localName
		}
		public final override function match(uri:String, localName:String):Boolean {
			return this.localName === localName && this.uri === uri;
		}
	}
}