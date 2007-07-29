package advancedflex.math.fuzzy {
	
	public interface IFuzzyLogic {
		function and(a:Number, b:Number):Number;
		function nand(a:Number, b:Number):Number;
		function or(a:Number, b:Number):Number;
		function nor(a:Number, b:Number):Number;
		function xor(a:Number, b:Number):Number;
		function not(a:Number):Number;
		function very(a:Number):Number;
		function notVery(a:Number):Number;
	}
}