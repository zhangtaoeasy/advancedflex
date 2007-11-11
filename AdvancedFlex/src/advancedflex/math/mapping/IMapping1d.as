package advancedflex.math.mapping {
	public interface IMapping1d {
		function getValue(value:Number):Number;
		function get range():Range;
		function getValueRange(range:Range):Range;
		function inRange(value:Number):Boolean;
	}
}