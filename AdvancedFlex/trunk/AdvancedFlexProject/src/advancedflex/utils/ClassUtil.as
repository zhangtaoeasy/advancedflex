package advancedflex.utils {
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedSuperclassName;
	import flash.net.getClassByAlias;
	
	public class ClassUtil {
		
		/**
		 * 根据名字得到类。它包括使用 <code>registerClassAlias</code> 定义的类。
		 * 它相当于 Java 中的 <code>Class.forName</code>。
		 * 
		 * @param name 类的名字。
		 * @return 类。
		 * @see flash.utils.getDefinitionByName
		 * @see flash.net.getClassByAlias
		 */
		public static function forName(name:String):Class {
			try {
				return getDefinitionByName(name) as Class;
			} catch(e:ReferenceError) {
				try {
					return getClassByAlias(name);
				}catch(e2:ReferenceError) {
					throw new ReferenceError("There is not such a class:<"+name+">.");
				}
			}
			return null;
		}
		public static function getClass(object:*):Class {
			return forName(getQualifiedClassName(object))
		}
		public static function getSuperClass(object:*):Class {
			return forName(getQualifiedSuperclassName(object));
		}
	}
}