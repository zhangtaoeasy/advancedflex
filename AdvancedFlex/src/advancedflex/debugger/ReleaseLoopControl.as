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
	
	/**
	 * <p>The LoopControl used in release application. It will do nothing.</p>
	 * 
	 * <p>在正式环境用的循环控制，他不会做任何事。</p>
	 * 
	 * @author Stephen
	 */
	internal final class ReleaseLoopControl implements ILoopControl {
		
		//do nothing.
		public function ReleaseLoopControl(args:Array) {
		}

		//do nothing.
		public function reset():void {
		}
		
		//do nothing.
		public function distory():void {
		}
		
		//do nothing.
		public function run():void{
		}
		
	}
}