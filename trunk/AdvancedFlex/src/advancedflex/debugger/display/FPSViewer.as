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
	import flash.events.Event;
	import advancedflex.debugger.FPSView;

	/**
	 * <p>The text field that shows FPS.</p>
	 * 
	 * <p>一个显示FPS的文本框。</p>
	 * 
	 * @author Stephen
	 */
	public class FPSViewer extends TextField {
		
		/**
		 * @param addEvent if add common FPSView event(This event can add only once to work well.)
		 * 是否添加FPSView的公用的事件。这个事件只需要添加一次。
		 */
		public function FPSViewer(addEvent:Boolean = false) {
			super();
			addEventListener(Event.ENTER_FRAME, enterframeHandler, false, 0, true);
			if(addEvent) {
				addEventListener(Event.ENTER_FRAME, FPSView.instance.enterFrameHandler, false, 0, true);
			}
		}
		
		//enter frame Handler
		private function enterframeHandler(event:Event):void {
			text = "" + FPSView.instance.fps;
		}
	}
}