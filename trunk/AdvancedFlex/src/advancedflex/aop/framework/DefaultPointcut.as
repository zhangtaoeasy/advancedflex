package advancedflex.aop.framework
{
	import advancedflex.aop.framework.Pointcut;
	import advancedflex.aop.framework.Advisor;

	public class DefaultPointcut extends Pointcut
	{
		public function DefaultPointcut() {
			super(new Advisor());
		}
		public override function match(qname:*):Boolean {
			return true;
		}
		
	}
}