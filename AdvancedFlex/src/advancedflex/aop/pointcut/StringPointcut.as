package advancedflex.aop.pointcut
{
	import advancedflex.aop.framework.Advisor;
	import advancedflex.aop.framework.Pointcut;

	public class StringPointcut extends Pointcut
	{
		private var str:String;
		public function StringPointcut(src:String, v:Advisor=null)
		{
			super(v);
			str = src
		}
		public final override function match(name:*):Boolean {
			return name == str;
		}
		
	}
}