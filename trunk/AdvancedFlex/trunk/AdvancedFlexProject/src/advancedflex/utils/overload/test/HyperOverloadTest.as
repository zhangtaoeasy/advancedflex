package advancedflex.utils.overload.test
{
	import advancedflex.debugger.aut.framework.TestCase;
	import advancedflex.debugger.aut.framework.ns.test;
	import advancedflex.utils.overload.HyperOverloadSupport;
	import advancedflex.utils.overload.overload;
	import advancedflex.utils.overload.patterns.NumberPattern;
	import advancedflex.utils.overload.patterns.NumberRangePattern;
	
	public class HyperOverloadTest extends TestCase {
		test function testOverload():void {
			foo(-1);
			foo(0);
			foo(1);
			foo(-1, -2);
			foo(-1, 1);
			foo();
			foo("1");
		}
		
		private static const fooOverload:HyperOverloadSupport = new HyperOverloadSupport()
		.register("fooNeg", new NumberRangePattern(-Infinity, 0, true, false))
		.register("fooZero", new NumberPattern(0))
		.register("fooPos", new NumberRangePattern(0, Infinity, false))
		.register("fooNegNeg", 
			new NumberRangePattern(-Infinity, 0, true, false), 
			new NumberRangePattern(-Infinity, 0, true, false))
		.register("fooNegPos", 
			new NumberRangePattern(-Infinity, 0, true, false), 
			new NumberRangePattern(0, Infinity, false))
		.register("fooString", String)
		.register("fooNone");
		private function foo(...args):void {
			fooOverload.invoke(this, args);
		}
		
		overload function fooNeg(n:int):void {
			trace("foo Neg");
		}
		overload function fooZero(n:int):void {
			trace("foo Zero");
		}
		overload function fooPos(n:int):void {
			trace("foo Pos");
		}
		overload function fooNegNeg(n1:int, n2:int):void {
			trace("foo Neg Neg");
		}
		overload function fooNegPos(n1:int, n2:int):void {
			trace("foo Neg Pos");
		}
		overload function fooNone():void {
			trace("foo None");
		}
		overload function fooString(str:String):void {
			trace("foo String");
		}
	}
}