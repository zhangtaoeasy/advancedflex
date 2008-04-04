package advancedflex.utils.overload.patterns
{
	public class FalsePattern implements IParamPattern
	{
		public function matchs(arg:*):Boolean
		{
			return !Boolean(arg);
		}
		
	}
}