package advancedflex.utils.collections {
	
	/**
	 * 一个可在观察者要得到 observable 对象更改通知时可实现 Observer 接口的类。
	 */
	public interface Observer {
		
		/**
		 * 只要改变了 observable 对象就调用此方法。
		 * @param target observable 对象。
		 * @param oldValue 旧值
		 * @param newValue 新值
		 * @param args 其他参数，依实现的类来定。
		 * 
		 */
		function update(target:Observable, oldValue:*, newValue:*, ...args):void;
		
		/**
		 * 只要 observable 对象删除了值就调用此方法。
		 * @param target observable 对象。
		 * @param value 被删除的值。
		 * @param args 其他参数，依实现的类来定。
		 */
		function remove(target:Observable, value:*, ...args):void;
		
		/**
		 * 只要 observable 对象添加了值就调用此方法。
		 * @param target observable 对象。
		 * @param value 被添加的值。
		 * @param args 其他参数，依实现的类来定。
		 * 
		 */
		function add(target:Observable, value:*, ...args):void;
	}
}