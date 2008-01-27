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
package advancedflex.core {
	
	import flash.events.Event;
	import flash.utils.getTimer;
	
	/**
	 * <p>View the FPS.</p>
	 * 
	 * <p>查看FPS</p>
	 * 
	 * @author Stephen
	 */
	public class FPSView {
		//instance
		private static const $INSTANCE:FPSView = new FPSView();
		
		/**
		 * <p>get instance</p>
		 * 
		 * <p>得到实例。</p>
		 * 
		 * @return instance 实例
		 */
		public static function get instance():FPSView {
			return $INSTANCE;
		}
		
		//first time
		private var ft:int;
		
		//second time
		private var st:int;
		
		[Bindable]
		/**
		 * FPS
		 */
		public var fps:int;
		
		/**
		 * <p>Enter Frame Event Handler.You must add this handler once to DisplayObject to view FPS.</p>
		 * 
		 * <p>Enter Frame Event Handler.你必须把它添加到DisplayObject才能查看FPS。</p>
		 */
		public function enterFrameHandler(event:Event):void {
			st = getTimer();
			fps = Math.round(1000 / (st - ft));
			ft = st;
		}
	}
}