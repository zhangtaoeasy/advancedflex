package advancedflex.utils.collections {
	public interface ITree extends ICollection, ISortedCollection {
		
		/**
		 * 打乱顺序重新排列。
		 * 
		 * 它可以让树近似地成为平衡树(每一个叶节点的高度之差的绝对值最大唯1)
		 */
		function random():void;
		
		/**
		 * 得到指定元素的高度。一般高度决定了访问速度，越高访问时间越长。
		 * @param item 元素
		 * @return 指定元素的高度。
		 */
		function getHight(item:*):int;
	}
}