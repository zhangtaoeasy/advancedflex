package advancedflex.errors {
	public class NoSuchItemError extends Error {
		public function NoSuchItemError(message:String="") {
			super(message, 0);
		}
		
	}
}