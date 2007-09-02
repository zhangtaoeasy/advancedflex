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
	public class Newline {
		
		public static const WINDOWS:String = "\n\r";
		
		public static const UNIX_LIKE:String = "\n";
		
		public static const BREAK:String = "\r";
		
		private static var defa:String = UNIX_LIKE;
		
		public static function get defaultNewline():String {
			return defa;
		}
		
		public static function set defaultNewline(v:String):void {
			defa = v;
		}
	}
}