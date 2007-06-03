package advancedflex.debugger.aut.framework {
	
	import advancedflex.io.TraceDataOutput;
	import flash.utils.IDataOutput;
	
	public class TraceConsole extends Console {
		private var _out:TraceDataOutput = new TraceDataOutput();
		protected override function get out():IDataOutput {
			return _out;
		}
	}
}