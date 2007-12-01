package advancedflex.afgl.images.fx {
	import flash.display.BitmapData;
	
	public interface ImageEffect {
		function setUp(startImg:BitmapData, endImg:BitmapData):void;
		function dispose(
			freeStartImg:Boolean = false, 
			freeEndImg:Boolean = false
			):void;
	}
}