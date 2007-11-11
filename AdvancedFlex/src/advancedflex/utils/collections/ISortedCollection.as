package advancedflex.utils.collections {
	/**
	 * 一个排了序的 Collection。
	 */
	public interface ISortedCollection extends IOrderlyCollection {
		
		/**
		 * 得到最小值。
		 * @return 最小值。
		 */
		function get lowestItem():*;
		
		/**
		 * 得到最大值。
		 * @return 最大值。
		 */
		function get highestItem():*;
		
		/**
		 * 删除最小值。
		 * @return 最小值。
		 */
		function removeLowestItem():*;
		
		/**
		 * 删除最大值。
		 * @return 最大值。
		 */
		function removeHighestItem():*;
		
		/**
		 * 排序的方法。
		 * @return 排序的方法。
		 */
		function get sortBy():int;
		
		/**
		 * 排序的键。适用与单键排序。
		 * @return 键。
		 */
		function get key():String;
		
		/**
		 * 排序的键组。适用与多键排序。
		 * @return 键组。
		 */
		function get keys():Array;
		
		/**
		 * 比较函数。格式为
		 * <p>function compare(a:*, b:*):int<br/>
		 * 返回值为-1，如果 a 应在排序后的序列中出现在 b 之前；0,a、b相等；1，如果 a 应在排序后的序列中出现在 b 之后。
		 * </p>
		 */
		function get compareFunction():Function;
		
		function set compareFunction():Function;
	}
}