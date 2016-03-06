package hxlpers.edge;
import edge.Entity;

/**
 * ...
 * @author damrem
 */
class EntityStaticExtension
{

	public static function getFirstComponentOfType<T>(user:Entity, type:Class<{}>, ?typeOut:Class<T>):T
	{
		if (!user.existsType(type))
		{
			return null;
		}
		
		for (comp in user.components())
		{
			
			var compClass = Type.getClass(comp);
			
			if (compClass == type)
			{
				return cast(comp);
			}
		}
		return null;
	}
	
}