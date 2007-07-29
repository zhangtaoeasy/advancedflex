package advancedflex.aop.pointcut
{
	import advancedflex.aop.framework.Advisor;
	import advancedflex.aop.framework.Pointcut;

	public class RegExpPointcut extends Pointcut
	{
		private var regex:RegExp;
		public function RegExpPointcut(pattern:RegExp, v:Advisor=null)
		{
			super(v);
			regex = pattern;
		}
		public final override function match(name:*):Boolean {
			var result:* = regex.exec(name)
			if(result && result[0] === name) {
				return true;
			}
			return false;
		}
		
	}
}