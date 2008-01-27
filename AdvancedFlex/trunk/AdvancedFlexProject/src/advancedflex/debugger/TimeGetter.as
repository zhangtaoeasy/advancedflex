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
package advancedflex.debugger {
	
	import flash.utils.getTimer;
	
	/**
	 * <p>Time getter.
	 * Get the time between some code.</p>
	 * 
	 * <p>记时器，得到一段代码执行的时间。</p>
	 * 
	 * @author Stephen
	 */
	public final class TimeGetter {
		
		private var startTime:int;
		
		/**
		 * <p>Create a new instance.It is the time that TimeGetter begins.</p>
		 * 
		 * <p>创建一个实例。记时器开始记时。</p>
		 */
		public function TimeGetter() {
			startTime = getTimer();
		}
		
		/**
		 * <p>get time</p>
		 * 
		 * <p>可到时间</p>
		 * 
		 * @return Time. 时间。
		 */
		public function get time():int {
			return getTimer() - startTime;
		}
	}
}