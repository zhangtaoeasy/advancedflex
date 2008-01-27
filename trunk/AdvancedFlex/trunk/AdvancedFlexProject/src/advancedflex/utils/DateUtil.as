package advancedflex.utils {
	public class DateUtil {
		public static function get NOW():Date {
			return new Date();
		}
		public static function birthday2Age(birthday:Date):Date {
			var diff:int = NOW.time - birthday.time;
			var result:Date = new Date();
			result.time = diff;
			return result;
		}
		
		/**
		 * 判断是否为闰年。
		 * 
		 * @param date 时间。
		 * @return 如果是闰年返回true；否则为false。
		 */
		public static function isLeapYear(date:Date):Boolean {
			var year:int = date.fullYear;
			return (year%4 == 0 && year%100 != 0) || year%400 == 0;
		}
	}
}