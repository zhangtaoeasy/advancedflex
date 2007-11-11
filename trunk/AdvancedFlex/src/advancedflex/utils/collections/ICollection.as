package advancedflex.utils.collections {
	
	/**
	 * Collection 层次结构中的根接口。
	 * Collection 表示一组对象，这些对象也称为 collection 的元素(Item)。
	 * 一些 collection 允许有重复的元素，而另一些则不允许。
	 * 一些 collection 是有序的，而另一些则是无序的。
	 * 此接口通常用来传递 collection，并在需要最大普遍性的地方操作这些 collection。
	 * 
	 * 所有通用的 Collection 实现类（通常通过它的一个子接口间接实现 Collection）应该提供两个标准构造方法：
	 * <ol>
	 * 	<li>一个是 void（无参数）构造方法，用于创建空 collection；</li>
	 * 	<li>另一个是带有 Collection 类型单参数的构造方法，用于创建一个具有与其参数相同元素新的 collection。</li>
	 * </ol>
	 * 实际上，后者允许用户复制任何 collection，以生成所需实现类型的一个等效 collection。
	 * 此接口中包含的"破坏性"方法，是指可修改其所操作的 collection 的那些方法，
	 * 如果此 collection 不支持该操作，则指定这些方法抛出 IllegalOperationError。
	 * 
	 * 一些 collection 实现对它们可能包含的元素有所限制。
	 * 例如，某些实现禁止 null 元素，而某些实现则对元素的类型有限制。
	 * 试图添加不合格的元素将抛出一个未经检查的异常，通常是 ArgumentError 或 TypeError。
	 * 试图查询是否存在不合格的元素会抛出一个异常。
	 * 
	 * 此接口是 Advanced Flex Collections Framework 的一个成员。 
	 */
	public interface ICollection {
		
		/**
		 * 确保此 collection 包含指定的元素（可选操作）。
		 * 如果此 collection 不允许有重复元素，并且已经包含了指定的元素，则抛出 ArgumentError。
		 * 
		 * 支持此操作的 collection 可以限制哪些元素能添加到此 collection 中来。
		 * 需要特别指出的是，一些 collection 拒绝添加 null 元素，其他一些 collection 将对可以添加的元素类型强加限制。
		 * Collection 类应该在其文档中清楚地指定能添加哪些元素方面的所有限制。
		 * 
		 * @param item 需要添加的元素。
		 * @return 自己(this)。
		 * @throw ArgumentError 如果元素的某属性不允许它添加到此 collection 中。
		 * @throw flash.errorsIllegalOperationError 如果不支持该方法。
		 */
		function add(item:*):ICollection;
		
		/**
		 * 将指定 collection 中的所有元素都添加到此 collection 中（可选操作）。
		 * 
		 * @param collection 要添加到此 collection 的元素的 collection
		 * @return 自己(this)。
		 * 
		 * @throw ArgumentError 如果元素不允许它添加到此 collection 中。
		 * @throw TypeError 如果指定的 item 的类型与此 collection 不兼容。
		 * @throw flash.errorsIllegalOperationError 如果不支持该方法。
		 */
		function addAll(collection:ICollection):ICollection;
		
		/**
		 * 从此 collection 中移除指定元素的单个实例（可选操作）。
		 * 如果不存在，则抛出 ArgumentError。
		 * 
		 * @param item 要从此 collection 中移除的元素。
		 * @return 自己(this)。
		 * 
		 * @throw ArgumentError 如果元素不存在。
		 * @throw flash.errorsIllegalOperationError 如果不支持该方法。
		 * @throw TypeError 如果指定的 collection 中有一个或多个元素的类型与此 collection 不兼容。
		 */
		function remove(item:*):ICollection;
		
		/**
		 * 移除此 collection 中那些也包含在指定 collection 中的所有元素（可选操作）。
		 * 此调用返回后，collection 中将不包含任何与指定 collection 相同的元素。
		 * 
		 * @param collection 要从此 collection 移除的元素的 collection
		 * @return 自己(this)。
		 * 
		 * @throw ArgumentError 如果移除的元素的 collection包含此 collection 拒绝添加的元素。
		 * @throw flash.errorsIllegalOperationError 如果不支持该方法。
		 * @throw TypeError 如果指定的 item 的类型与此 collection 不兼容。
		 */
		function removeAll(collection:ICollection):ICollection;
		
		/**
		 * 移除此 collection 中的所有元素（可选操作）。
		 * 
		 * @throw TypeError 如果指定的 collection 中有一个或多个元素的类型与此 collection 不兼容。
		 * @throw flash.errorsIllegalOperationError 如果不支持该方法。
		 */
		function clear():void;
		
		/**
		 * 如果此 collection 不包含任何元素，则返回 true。
		 * 
		 * @return 如果此 collection 不包含任何元素，则返回 true。
		 */
		function get isEmpty():Boolean;
		
		/**
		 * 如果此 collection 包含指定的元素，则返回 true（可选操作）。
		 * 
		 * @param item 用于测试在此 collection 中是否存在的元素。
		 * @param compareFunction 比较函数，如果省略，则会使用 "===" 来比较。
		 * @return 如果此 collection 包含指定的元素，则返回 true。
		 * 
		 * @throw ArgumentError 如果指定的 item 与此 collection 不兼容。
		 * @throw TypeError 如果指定的 item 的类型与此 collection 不兼容。
		 * @throw flash.errorsIllegalOperationError 如果不支持该方法。
		 */
		function contains(item:*, compareFunction:Function = null):Boolean;
		
		/**
		 * 如果此 collection 包含指定 collection 中的所有元素，则返回 true（可选操作）。
		 * @param collection 将检查是否包含在此 collection 中的 collection
		 * @return 如果此 collection 包含指定 collection 中的所有元素，则返回 true。
		 * 
		 * @throw flash.errorsIllegalOperationError 如果不支持该方法。
		 * @throw TypeError 如果指定的 collection 中有一个或多个元素的类型与此 collection 不兼容。
		 */
		function containsAll(collection:ICollection):Boolean;
		
		/**
		 * 比较此 collection 与指定对象是否相等。
		 * @param o 要与此 collection 进行相等性比较的对象。
		 * @param compareFunction 比较函数，如果省略，则会使用 "===" 来比较。
		 * @return 如果指定对象与此 collection 相等，则返回 true
		 */
		function equals(o:ICollection, compareFunction:Function = null):Boolean;
		
		/**
		 * 返回此 collection 中的元素数。
		 * @return 此 collection 中的元素数
		 * @see CollectionSize
		 */
		function get size():Number;
		
		/**
		 * 返回包含此 collection 中所有元素的数组。
		 * 如果 collection 对其迭代器返回的元素顺序做出了某些保证，那么此方法必须以相同的顺序返回这些元素。
		 * 返回的数组将是"安全的"，因为此 collection 并不维护对返回数组的任何引用。
		 * （换句话说，即使 collection 受到数组的支持，此方法也必须分配一个新的数组）。
		 * 因此，调用者可以随意修改返回的数组。
		 * 
		 * 此方法充当了基于数组的 API 与基于 collection 的 API 之间的桥梁。 
		 * @return 包含此 collection 中所有元素的数组
		 */
		function toArray():Array;
		
		/**
		 * 对 Collection 中的每一项执行函数。
		 * 
		 * @param callback 要对 Collection 中的每一项运行的函数。 
		 * 此函数可以包含简单的命令或者更复杂的操作，并用三个参数来调用，即项值、项索引和 Collection 对象：
		 * 	function callback(item:*, index:int, collection:ICollection):void;
		 * 当此 Collection 为无序时，index始终为-1。
		 */
		function forEach(callback:Function):void;
		
		/**
		 * 对 Collection 中的每一项执行测试函数，并构造一个新Collection，其中的所有项都对指定的函数返回 true。
		 * 如果某项返回 false，则新Collection中将不包含此项。
		 * 
		 * @param callback 要对 Collection 中的每一项运行的函数。 
		 * 该函数可以包含简单的比较操作或者更复杂的操作，并用三个参数来调用，即项值、项索引和 Collection 对象：
		 * 	function callback(item:*, index:int, collection:ICollection):Boolean;
		 * 当此 Collection 为无序时，index始终为-1。
		 * 
		 * @return 一个新Collection，它包含原始Collection中返回 true 的所有项。
		 */
		function filter(callback:Function):ICollection;
		
		/**
		 * 对 Collection 中的每一项执行测试函数，直到获得对指定的函数返回 false 的项。
		 * 使用此方法可确定 Collection 中的所有项是否满足某一条件，如具有的值小于某一特定数值。
		 * 
		 * @param callback 要对 Collection 中的每一项运行的函数。
		 * 该函数可以包含简单的比较操作或者更复杂的操作，并用三个参数来调用，即项值、项索引和 Collection 对象：
		 * 	function callback(item:*, index:int, collection:ICollection):Boolean;
		 * 当此 Collection 为无序时，index始终为-1。
		 * 
		 * @return 如果 Collection 中的所有项对指定的函数都返回 true，则为布尔值 true；否则为 false。
		 */
		function every(callback:Function):Boolean;
		
		/**
		 * 对 Collection 中的每一项执行函数并构造一个新 Collection ，
		 * 其中包含与原始 Collection 中的每一项的函数结果相对应的项。
		 * 
		 * @param callback 要对 Collection 中的每一项运行的函数。
		 * 此函数可以包含简单的命令或更复杂的操作，并用 3 个参数来调用，即项值、项索引和 Collection 对象：
		 * function callback(item:*, index:int, collection:ICollection):void;
		 * 当此 Collection 为无序时，index始终为-1。
		 * 
		 * @return 一个新 Collection ，其中包含此函数对原始 Collection 中每一项的执行结果。
		 */
		function map(callback:Function):ICollection;
		
		/**
		 * 对 Collection 中的每一项执行测试函数，直到获得返回 true 的项。 
		 * 使用此方法确定 Collection 中的所有项是否满足条件，如具有小于某一特定数值的值。
		 * 
		 * @param callback 要对 Collection 中的每一项运行的函数。
		 * 此函数可以包含简单的比较操作或者更复杂的操作，并用三个参数来调用，即项值、项索引和 Collection 对象：
		 * 	function callback(item:*, index:int, array:Array):Boolean;
		 * 当此 Collection 为无序时，index始终为-1。
		 * 
		 * @return 如果 Collection 中的有一项对于指定的函数返回 true，则为布尔值 true，否则为 false。
		 */
		function some(callback:Function):Boolean;
	}
}