package advancedflex.utils.overload.test {
	import advancedflex.debugger.aut.framework.Assert;
	import advancedflex.debugger.aut.framework.TestCase;
	import advancedflex.debugger.aut.framework.ns.test;
	import advancedflex.utils.overload.OverloadSupport;
	import advancedflex.utils.overload.RestArgs;
	import advancedflex.utils.overload.overload;
	
	use namespace test;
	public class OverloadSupportTest extends TestCase {
		
		test function testFoo():void {
			foo(1);
			foo(1,2);
			foo("123");
			foo();
			foo(null);
			try {
				foo(1,2,3);
				Assert.fail();
			} catch(e:Error) {
			}
			
			foo2("abc");
			foo2({});
			foo2(1);
			foo2([]);
			foo2(1,2);
			
			foo3(int(12));
			foo3(-2);
			foo3(0xFFFFFFFF);
			foo3(1.2);
			
			foo4(1);
			foo4(1, 2);
		}
		
		private static const fooOverload:OverloadSupport = new OverloadSupport()
			.register("fooInt", int)
			.register("fooIntInt", int, int)
			.register("fooString", String)
			.register("fooNone");
		private function foo(...args):void {
			fooOverload.invoke(this, args);
		}
		overload function fooInt(n:int):void {
			trace("fooInt");
		}
		overload function fooIntInt(n1:int, n2:int):void {
			trace("fooIntInt");
		}
		overload function fooString(str:String):void {
			trace("fooString");
		}
		overload function fooNone():void {
			trace("fooNone");
		}
		
		private static const foo2Overload:OverloadSupport = new OverloadSupport()
			.register("foo2String", String)
			.register("foo2Object", Object)
			.setDefault("foo2Default");
			
		private function foo2(...args):void {
			foo2Overload.invoke(this, args);
		}
		overload function foo2String(str:String):void {
			trace("foo2String");
		}
		overload function foo2Object(obj:Object):void {
			trace("foo2Object");
		}
		overload function foo2Default(...args):void {
			trace("foo2Default");
		}
		
		private static const foo3Overload:OverloadSupport = new OverloadSupport()
			.register("foo3Int", int)
			.register("foo3Uint", uint)
			.register("foo3Number", Number);
			
		private function foo3(...args):void {
			foo3Overload.invoke(this, args);
		}
		overload function foo3Int(o:int):void {
			trace("foo3Int");
		}
		overload function foo3Uint(o:uint):void {
			trace("foo3Uint");
		}
		overload function foo3Number(o:Number):void {
			trace("foo3Number");
		}
		
		private static const foo4Overload:OverloadSupport = new OverloadSupport()
			.register("foo4Int", int)
			.register("foo4IntRestArgs", int, RestArgs);
			
		private function foo4(...args):void {
			foo4Overload.invoke(this, args);
		}
		overload function foo4Int(o:int):void {
			trace("foo4int");
		}
		overload function foo4IntRestArgs(o:int, ...args):void {
			trace("foo4Int...Args");
		}
	}
}