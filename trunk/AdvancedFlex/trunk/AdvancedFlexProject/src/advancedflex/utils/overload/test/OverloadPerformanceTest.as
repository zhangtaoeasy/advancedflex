package advancedflex.utils.overload.test {
	import advancedflex.debugger.aut.framework.TestCase;
	import advancedflex.debugger.aut.framework.ns.time;
	import advancedflex.utils.overload.OverloadBuilder;
	import advancedflex.utils.overload.OverloadSupport;
	import advancedflex.utils.overload.RestArgs;
	import advancedflex.utils.overload.overload;
	
	import flash.system.System;
	import flash.utils.getTimer;

	public class OverloadPerformanceTest extends TestCase {
		private static const MAX_LOOP:int = 10000
		time function overloadSupport():int {
			System.gc();
			var t:int = getTimer();
			var memo:int = System.totalMemory;
			for(var i:int = 0; i < MAX_LOOP; i++) {
				foo1(1);
				foo1(1,2);
				foo1(1,2,3);
				foo1(1,2,3,4);
			}
			console.println("Used memoey :", System.totalMemory - memo);
			console.println("Used times :", getTimer() - t);
			return int.MAX_VALUE;
		}
		
		time function overloadbuilder():int {
			System.gc();
			var t:int = getTimer();
			var memo:int = System.totalMemory;
			for(var i:int = 0; i < MAX_LOOP; i++) {
				foo2(1);
				foo2(1,2);
				foo2(1,2,3);
				foo2(1,2,3,4);
			}
			console.println("Used memoey :", System.totalMemory - memo);
			console.println("Used times :", getTimer() - t);
			return int.MAX_VALUE;
		}
		
		private static const overloadFoo1:OverloadSupport = 
			new OverloadSupport()
			.register("fooInt", int)
			.register("fooIntInt", int, int)
			.register("fooIntIntInt", int, int, int)
			.register("fooIntIntIntArgs", int, int, int, RestArgs);
		
		private function foo1(...args):int {
			return overloadFoo1.invoke(this, args);
		}
		private function foo2(...args):int {
			return OverloadBuilder.setup(this, args)
				.tryThis(fooInt, int)
				.tryThis(fooIntInt, int, int)
				.tryThis(fooIntIntInt, int, int, int)
				.tryThis(fooIntIntIntArgs, int, int, int, RestArgs)
				.getResult();
		}
		private function fooInt(n:int):int {
			return 1;
		}
		private function fooIntInt(n1:int, n2:int):int {
			return 1;
		}
		private function fooIntIntInt(n1:int, n2:int, n3:int):int {
			return 1;
		}
		private function fooIntIntIntArgs(n1:int, n2:int, n3:int, ...args):int {
			return 1;
		}
		
		overload function fooInt(n:int):int {
			return 1;
		}
		overload function fooIntInt(n1:int, n2:int):int {
			return 1;
		}
		overload function fooIntIntInt(n1:int, n2:int, n3:int):int {
			return 1;
		}
		overload function fooIntIntIntArgs(n1:int, n2:int, n3:int, ...args):int {
			return 1;
		}
		
	}
}