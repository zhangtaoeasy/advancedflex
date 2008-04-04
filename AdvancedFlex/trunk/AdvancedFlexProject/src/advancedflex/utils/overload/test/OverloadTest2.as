package advancedflex.utils.overload.test {
	import advancedflex.debugger.aut.framework.TestCase;
	import advancedflex.debugger.aut.framework.ns.test;
	import advancedflex.utils.overload.OverloadBuilder;
	import advancedflex.utils.overload.RestArgs;

	public class OverloadTest2 extends TestCase {
		test function testFoo2():void {
			foo(1);
			foo(1, 2);
			foo(1, 2, 3);
			foo()
			foo("1");
		}
		private function foo(...args):void {
			OverloadBuilder.setup(this, args)
			.tryThis(fooInt, int)
			.tryThis(fooIntInt, int, int)
			.tryThis(fooIntIntRestArgs, int, int, RestArgs)
			.tryThis(fooNone)
			.others(fooOthers)
			.getResult();
		}
		
		private function fooInt(o:int):void {
			trace("fooInt")
		}
		private function fooIntInt(o:int, o2:int):void {
			trace("fooIntInt")
		}
		private function fooIntIntRestArgs(o:int, o2:int, ...args):void {
			trace("fooIntInt...Args")
		}
		private function fooOthers(...args):void {
			trace("foo others")
		}
		private function fooNone(...args):void {
			trace("foo None")
		}
	}
}