package advancedflex.debugger.aut.framework {
	import advancedflex.debugger.aut.io.AUTOutput;
	
	internal interface TestTask {
		function doTask(out:AUTOutput):void;
	}
}