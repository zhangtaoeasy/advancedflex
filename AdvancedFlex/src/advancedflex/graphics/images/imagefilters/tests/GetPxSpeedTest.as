package advancedflex.graphics.images.imagefilters.tests {
	import advancedflex.debugger.aut.framework.TestCase;
	import advancedflex.debugger.aut.framework.ns.*;
	import flash.display.BitmapData;
	import advancedflex.debugger.TimeGetter;
	import flash.geom.Point;
	
	use namespace test;
	
	/**
	 * @private
	 */
	public class GetPxSpeedTest extends TestCase {
		
		test function test1():void {
			var bitmap:BitmapData = new BitmapData(128, 128, false);
			bitmap.noise(0);
			var t:TimeGetter = new TimeGetter();
			for(var i:int = 128; i; i--) {
				for(var j:int = 128; j; j--) {
					bitmap.getPixel(i,j);
				}
			}
			for(i = 128; i; i--) {
				for(j = 128; j; j--) {
					bitmap.getPixel(i,j);
					bitmap.getPixel(i,j);
					bitmap.getPixel(i,j);
					bitmap.getPixel(i,j);
					bitmap.getPixel(i,j);
					bitmap.getPixel(i,j);
				}
			}
			out.print("      getPx use:", t.time);
			bitmap.dispose();
		}
		test function test2():void {
			var bitmap:BitmapData = new BitmapData(128, 128, true);
			bitmap.noise(0);
			bitmap.copyChannel(bitmap, bitmap.rect, new Point(), 1, 8);
			var t:TimeGetter = new TimeGetter();
			for(var i:int = 128; i; i--) {
				for(var j:int = 128; j; j--) {
					bitmap.getPixel(i,j);
				}
			}
			for(i = 128; i; i--) {
				for(j = 128; j; j--) {
					bitmap.getPixel(i,j);
					bitmap.getPixel(i,j);
					bitmap.getPixel(i,j);
					bitmap.getPixel(i,j);
					bitmap.getPixel(i,j);
					bitmap.getPixel(i,j);
				}
			}
			out.print("trans getPx use:", t.time);
			bitmap.dispose();
		}
		
		test function test3():void {
			var bitmap:BitmapData = new BitmapData(128, 128, false);
			bitmap.noise(0);
			var buf:Array = new Array(128*128);
			var t:TimeGetter = new TimeGetter();
			for(var i:int = 128; i; i--) {
				for(var j:int = 128; j; j--) {
					buf[i*128+j] = bitmap.getPixel(i,j);
				}
			}
			for(i = 128; i; i--) {
				for(j = 128; j; j--) {
					buf[i*128+j];
					buf[i*128+j];
					buf[i*128+j];
					buf[i*128+j];
					buf[i*128+j];
					buf[i*128+j];
				}
			}
			out.print("bufed getPx use:", t.time);
			bitmap.dispose();
		}
		test function test4():void {
			var bitmap:BitmapData = new BitmapData(128, 128, true);
			bitmap.noise(0);
			bitmap.copyChannel(bitmap, bitmap.rect, new Point(), 1, 8);
			var buf:Array = new Array(128*128);
			var t:TimeGetter = new TimeGetter();
			for(var i:int = 128; i; i--) {
				for(var j:int = 128; j; j--) {
					buf[i*128+j] = bitmap.getPixel(i,j);
				}
			}
			for(i = 128; i; i--) {
				for(j = 128; j; j--) {
					buf[i*128+j];
					buf[i*128+j];
					buf[i*128+j];
					buf[i*128+j];
					buf[i*128+j];
					buf[i*128+j];
				}
			}
			out.print("tr ed getPx use:", t.time);
			bitmap.dispose();
		}
	}
}