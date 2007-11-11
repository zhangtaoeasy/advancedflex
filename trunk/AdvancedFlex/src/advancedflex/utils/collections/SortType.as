package advancedflex.utils.collections {
	
	/**
	 * 指定 ISortedCollection 的排序方式。
	 */
	public final class SortType {
		
		/**
		 * 升序排序。即 1，2，4，6，8
		 */
		public static const ASCENDING:int = 1;
		
		/**
		 * 降序排序。即 8，6，4，2，1
		 */
		public static const DESCENDING:int = 2;
		
		/**
		 * 使用绝对排序。(用>、<、==来比较)
		 */
		public static const ABSOLUTE:int = 4;
		
		/**
		 * 使用相对排序。(使用比较函数来比较)
		 */
		public static const RELATIVE:int = 8;
		
		/**
		 * 使用单键排序。(当使用绝对排序时才有用)
		 */
		public static const SINGLE_KEY:int = 16;
		
		/**
		 * 使用多键排序。(当使用绝对排序时才有用)
		 */
		public static const MULT_KEY:int = 32;
		
	}
}