package advancedflex.utils {
	public interface IDiffSet {
		function apply(oldValue:*):*;
		function recovery(newValue:*):*;
		function get source():Array;
	}
}