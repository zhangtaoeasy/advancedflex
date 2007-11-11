package advancedflex.math.mapping {
	
	/**
	 * 取值范围
	 */
	public class Range {
		
		private var $low:Number,$includeLow:Boolean;
		
		private var $high:Number,$includeHigh:Boolean;
		
		/**
		 * 创建一个 Range 对象
		 * @param low 下限
		 * @param high 上限
		 */
		public function Range(low:Number, high:Number, includeLow:Boolean = true, includeHigh:Boolean = true) {
			$low = low;
			$includeLow = includeLow;
			$high = high;
			$includeHigh = includeHigh;
		}
		
		/**
		* 下限
		*/
		public function get low():Number {
			return $low
		}
		
		/**
		 * 是否包含下限。
		 * @return 是否包含下限。
		 */
		public function get includeLow():Boolean {
			return $includeLow
		}
		
		/**
		* 上限
		*/
		public function get high():Number {
			return $high;
		}
		
		/**
		 * 是否包含上限。
		 * @return 是否包含上限。
		 */
		public function get includeHigh():Boolean {
			return $includeHigh;
		}
		
		public function contains(n:Number):Boolean {
			var result:Boolean = true;
			if($includeLow) {
				result &&= n>=$low;
			}else{
				result &&= n>$low;
			}
			if($includeHigh) {
				result &&= n<=$high;
			}else{
				result &&= n<$high;
			}
			return result;
		}
		public function containsRange(range:Range):Boolean {
			var result:Boolean = true;
			if($includeLow) {
				result &&= range.$low>=$low;
			}else{
				result &&= range.$low>$low;
			}
			if($includeHigh) {
				result &&= range.$high<=$high;
			}else{
				result &&= range.$high<$high;
			}
			return result;
		}
		public function far(n:Number):Number {
			return ( $low+$high )/2 < n ? $low : $high;
		}
	}
}