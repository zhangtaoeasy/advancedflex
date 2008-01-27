/////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2007 Advanced Flex Project http://code.google.com/p/advancedflex/. 
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
package advancedflex.resource {
	
	/**
	 * 换行符
	 */
	public final class Newline {
		
		/**
		 * Windows的模式(CR LF)。
		 */
		public static const WINDOWS:String = "\r\n";
		
		/**
		 * Unix系(包括Linux)的模式(LF)。
		 */
		public static const UNIX_LIKE:String = "\n";
		
		/**
		 * Apple Macintosh的模式(CR)。
		 */
		public static const APPLE:String = "\r";
		
		private static var defa:String = UNIX_LIKE;
		
		/**
		 * 默认的换行符。默认为<code>UNIX_LIKE</code>。
		 * @return 默认的换行符。
		 */
		public static function get defaultNewline():String {
			return defa;
		}
		public static function set defaultNewline(v:String):void {
			defa = v;
		}
	}
}