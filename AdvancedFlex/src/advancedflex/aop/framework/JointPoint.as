package advancedflex.aop.framework
{
	public class JointPoint
	{
		internal var advisor:Advisor;
		public function JointPoint(advisor:Advisor) {
			this.advisor = advisor;
		}
		internal function execute(methodInfo:MethodInfo):void {
			advisor.around(methodInfo, this);
		}
		public function proceed(methodInfo:MethodInfo):void {
			try {
				advisor.before(methodInfo);
				methodInfo.invoke();
				advisor.returning(methodInfo);
			} catch(e:Error) {
				advisor.throwing(methodInfo, e);
			} catch(e:*) {
				advisor.exception(methodInfo, e);
			} finally {
				advisor.after(methodInfo);
			}
		}
	}
}