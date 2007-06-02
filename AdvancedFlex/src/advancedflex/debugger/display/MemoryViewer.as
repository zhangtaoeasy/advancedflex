/////////////////////////////////////////////////////////////////////////////
//Copyright 2007 Advanced Flex Project http://code.google.com/p/advancedflex/. 
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
/////////////////////////////////////////////////////////////////////////////
package advancedflex.debugger.display {
	
	import flash.text.TextField;
	import flash.system.System;
	import flash.events.Event;
	
	/**
	 * <p>The text field that shows Memory used.</p>
	 * 
	 * <p>一个显示已使用的内存的文本框。</p>
	 * 
	 * @author Stephen
	 */
	public class MemoryViewer extends TextField {
		
		public function MemoryViewer() {
			super();
			addEventListener(Event.ENTER_FRAME, enterframeHandler, false, 0, true);
		}
		
		//enter frame Handler
		private function enterframeHandler(event:Event):void {
			text = "" + System.totalMemory / 1024 + " KB";
		}
	}
}