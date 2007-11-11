package advancedflex.utils.collections {
	
	/**
	 * 此接口表示模型视图范例中的 observable 对象，或者说"数据"。
	 * 一个 observable 对象可以有一个或多个观察者。观察者可以是实现了 Observer 接口的任意对象。
	 */
	public interface Observable {
		
		/**
		 * 如果观察者与集合中已有的观察者不同，则向对象的观察者集中添加此观察者。
		 * @param observer 要添加的观察者。
		 */
		function addObserver(observer:Function):void;
		
		/**
		 * 从对象的观察者集合中删除某个观察者。
		 * @param observer 要删除的观察者。
		 */
		function removeObserver(observer:Function):void;
		
		/**
		 * 查找是否已经添加了指定的观察者。
		 * @param observer 观察者。
		 * @return true：已经添加；false：还未添加。
		 */
		function hasObserver(observer:Function):Boolean;
	}
}