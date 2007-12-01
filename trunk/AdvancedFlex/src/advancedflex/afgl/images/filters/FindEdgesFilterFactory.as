package advancedflex.afgl.images.filters {
	import flash.errors.IllegalOperationError;
	import flash.filters.BitmapFilter;
	import flash.filters.ConvolutionFilter;

	/**
	 * 查找边缘滤镜工厂。
	 * <p><strong>它是AFGL(Advanced Flex Graphics Library)的一部分。</strong></p>
	 * @see advancedflex.display.images.filtersFilterDirection
	 */
	public class FindEdgesFilterFactory implements IBitmapFilterFactory {
		
		/* Finding Edges' Direction */
		private var $direction:int;
		
		/* Finding Edges' Level*/
		private var $level:Number;
		
		/**
		 * 查找的方向。
		 */
		public function get direction():int {
			return $direction;
		}
		
		public function set direction(v:int):void {
			if($direction>=1 && $direction <=8) {
				$direction = v;
				$changed = true;
			}else{
				throw new ArgumentError(
					"Param:<direction> must between 1 and 8");
			}
		}
		
		/**
		 * 查找的强度。
		 */
		public function get level():Number {
			return $level;
		}
		
		public function set level(v:Number):void {
			$level = v;
			$changed = true;
		}
		
		/* Matrix 3x3 */
		[ArrayElementType("Number")]
		private var $matrix:Array;
		
		/* If this instance doesn't disposed. */
		private var $alive:Boolean = true;
		
		/* If this instance changed. */
		private var $changed:Boolean = true;
		
		public function FindEdgesFilterFactory(
			direction:int, 
			level:Number = 1) 
		{
			$direction = direction;
			$level = level;
		}
		
		public function create():BitmapFilter {
			if($alive) {
				if($changed) {
					$setUpMatrix();
				}
				return new ConvolutionFilter(3, 3, $matrix, 1);
			}
			throw new IllegalOperationError("This FilterFactory is disposed.");
		}
		
		public function dispose():void {
			$matrix = null;
			$alive = false;
		}
		
		public function clone():IBitmapFilterFactory {
			return new FindEdgesFilterFactory($direction, $level);
		}
		/* Set up Matrix */
		private function $setUpMatrix():void {
			var n:Number = $level;
			switch ($direction) {
				case FilterDirection.RIGHT :
				case FilterDirection.LEFT :
					$matrix = [
						0,  0,  0, 
						n,-2*n, n, 
						0,  0,  0,
					];
				break;
				
				case FilterDirection.TOP_RIGHT :
				case FilterDirection.BOTTOM_LEFT :
					$matrix = [
						0,  0,  n, 
						0,-2*n, 0, 
						n,  0,  0,
					];
				break;
				
				case FilterDirection.TOP :
				case FilterDirection.BOTTOM :
					$matrix = [
						0,  n,  0, 
						0,-2*n, 0, 
						0,  n,  0,
					];
				break;
				
				default://FilterDirection.TOP_LEFT
						//FilterDirection.BOTTOM_RIGHT
					$matrix = [
						n,  0,  0, 
						0,-2*n, 0, 
						0,  0,  n,
					];
			}
		}
	}
}