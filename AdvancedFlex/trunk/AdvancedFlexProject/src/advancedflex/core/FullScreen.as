////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2007 Advanced Flex Project http://advancedflex.googlecode.com/. 
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
//
////////////////////////////////////////////////////////////////////////////////

package advancedflex.core {
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.geom.Rectangle;
	
	/**
	 * 全屏模式
	 */
	public class FullScreen {
		
		/**
		 * 进入全屏模式。
		 * 
		 * @param display 任意一个加入了 <code>displayList</code> 的 <code>DisplayObject<code>。
		 */
		public static function go(display:DisplayObject):void {
			var stage:Stage = display.stage;
			stage["fullScreenSourceRect"] = new Rectangle(0, 0, stage.width, stage.height);
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}
		
		/**
		 * 退出全屏模式。
		 * 
		 * @param display 任意一个加入了 <code>displayList</code> 的 <code>DisplayObject<code>。
		 */
		public static function back(display:DisplayObject):void {
			display.stage.displayState = StageDisplayState.NORMAL;
		}
	}
}