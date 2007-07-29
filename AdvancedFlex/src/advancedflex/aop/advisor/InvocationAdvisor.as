package advancedflex.aop.advisor
{
	import advancedflex.aop.framework.Advisor;
	import advancedflex.aop.framework.JointPoint;
	import advancedflex.aop.framework.MethodInfo;

	public class InvocationAdvisor extends Advisor {
		
		public var aroundAdvice:Function;
		
		public var beforeAdvice:Function;
		
		public var returningAdvice:Function;
		
		public var throwingAdvice:Function;
		
		public var exceptionAdvice:Function;
		
		public var afterAdvice:Function;
		
		public override function around(methodInfo:MethodInfo, jointPoint:JointPoint):void {
			if(!(aroundAdvice)) {
				jointPoint.proceed(methodInfo);
			} else {
				aroundAdvice(methodInfo, jointPoint);
			}
		}
		
		/**
		 * Callback before a given method is invoked.<br/>
		 * 在JointPoint前执行。
		 * 
		 * @param methodInfo Info of given method. 调用方法的信息。
		 */
		public override function before(methodInfo:MethodInfo):void {
			if(beforeAdvice != null) {
				beforeAdvice(methodInfo);
			}
		}
		
		/**
		 * Callback after a given method successfully returned.<br/>
		 * 在JointPoint成功返回后执行。
		 * 
		 * @param methodInfo Info of given method. 调用方法的信息。
		 */
		public override function returning(methodInfo:MethodInfo):void {
			if(returningAdvice != null) {
				returningAdvice(methodInfo);
			}
		}
		
		public override function throwing(methodInfo:MethodInfo, error:Error):void {
			if(!(beforeAdvice)) {
				throw error;
			} else {
				throwingAdvice(methodInfo, error);
			}
		}
		
		public override function exception(methodInfo:MethodInfo, exception:*):void {
			if(!(beforeAdvice)) {
				throw exception;
			} else {
				exceptionAdvice(methodInfo, exception);
			}
		}
		
		public override function after(methodInfo:MethodInfo):void {
			if(returningAdvice != null) {
				afterAdvice(methodInfo);
			}
		}
	}
}