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
package advancedflex.debugger.aut.framework {
	
	import advancedflex.debugger.aut.io.AUTOutput;
	
	/**
	 * Test interface
	 * @author Stephen
	 */
	public interface Test {
		
		/**
		 * <p>Get the list of all test.</p>
		 * <p>得到测试的列表</p>
		 * 
		 *  @return The list of all test. 测试的列表。
		 * 
		 * <p>Return format:</p>
		 * 
		 * <table border="1">
		 * <tr>
		 * <th scope="col">Tag</th>
		 * <th scope="col">Element</th>
		 * <th scope="col">Description</th>
		 * </tr>
		 * <tr>
		 * <td>aut-list</td>
		 * <td>&nbsp;</td>
		 * <td><p>The root of list. </p>
		 * <p>根元素。</p></td>
		 * </tr>
		 * <tr>
		 * <td>TestSuite</td>
		 * <td>&nbsp;</td>
		 * <td><p>The TestSuite Test. </p>
		 * <p>TestSuite测试。 </p></td>
		 * </tr>
		 * <tr>
		 * <td>&nbsp;</td>
		 * <td>name</td>
		 * <td><p>The TestSuite name.</p>
		 * <p>TestSuite的名字。</p></td>
		 * </tr>
		 * <tr>
		 * <td>TestCase</td>
		 * <td>&nbsp;</td>
		 * <td><p>The TestCase Test.</p>
		 * <p>TestCase测试。</p></td>
		 * </tr>
		 * <tr>
		 * <td>&nbsp;</td>
		 * <td>name</td>
		 * <td><p>The TestCase Class' full uri.</p>
		 * <p>TestCase的完整类名。</p></td>
		 * </tr>
		 * <tr>
		 * <td>method</td>
		 * <td>&nbsp;</td>
		 * <td><p>The tested method.</p>
		 * <p>被测试的方法。</p></td>
		 * </tr>
		 * <tr>
		 * <td>&nbsp;</td>
		 * <td>name</td>
		 * <td><p>The method name.</p>
		 * <p>方法名</p></td>
		 * </tr>
		 * <tr>
		 * <td>&nbsp;</td>
		 * <td>type</td>
		 * <td><p>The method type.</p>
		 * <p>方法类型。</p></td>
		 * </tr>
		 * <tr>
		 * <td>&nbsp;</td>
		 * <td>timeout</td>
		 * <td><p>The method timeout-time.(It only used in type==time.)</p>
		 * <p>超时的时间（当type=time时才有。）</p></td>
		 * </tr>
		 * </table>
		 */
		function getTestHeader(isHead:Boolean = true):XML;
		
		/**
		 * <p>run Test</p>
		 * <p>测试</p>
		 * @param out The Output of Test. 测试的输出。
		 */
		function runTest(out:AUTOutput, options:String = ""):void;
	}
}