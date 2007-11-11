package advancedflex.utils.collections {
	public class BinaryTree implements ITree {
		
		protected var root:Node;
		
		public function BinaryTree(sortType:int, compare:*, collection:ICollection = null) {
			root = new Node();
		}
		
		public function getHight(item:*):int {
			return 0;
		}
		
		public function random():void {
		}
		
		public function map(callback:Function):ICollection {
			return null;
		}
		
		public function filter(callback:Function):ICollection {
			return null;
		}
		
		public function equals(o:ICollection, compareFunction:Function=null):Boolean {
			return false;
		}
		
		public function contains(item:*, compareFunction:Function=null):Boolean {
			return false;
		}
		
		public function toArray():Array {
			return null;
		}
		
		public function get isEmpty():Boolean {
			return false;
		}
		
		public function remove(item:*):ICollection {
			return null;
		}
		
		public function every(callback:Function):Boolean {
			return false;
		}
		
		public function clear():void {
		}
		
		public function forEach(callback:Function):void {
		}
		
		public function removeAll(collection:ICollection):ICollection {
			return null;
		}
		
		public function containsAll(collection:ICollection):Boolean {
			return false;
		}
		
		public function some(callback:Function):Boolean {
			return false;
		}
		
		public function addAll(collection:ICollection):ICollection {
			return null;
		}
		
		public function add(item:*):ICollection {
			return null;
		}
		
		public function get size():Number {
			return 0;
		}
		
		public function get highestItem():* {
			return null;
		}
		
		public function get compareFunction():Function {
			return null;
		}
		
		public function set compareFunction():Function {
			return null;
		}
		
		public function get lowestItem():* {
			return null;
		}
		
		public function removeHighestItem():* {
			return null;
		}
		
		public function get sortBy():int {
			return 0;
		}
		
		public function get key():String {
			return null;
		}
		
		public function removeLowestItem():* {
			return null;
		}
		
		public function get keys():Array {
			return null;
		}
	}
}
class Node {
	internal var value:*;
	internal var left:Node;
	internal var right:Node;
	public function Node(value:* = null, left:Node = null, right:Node = null) {
		
	}
}