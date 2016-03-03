package heroes;
import edge.Entity;
import edge.IComponent;

/**
 * ...
 * @author damrem
 */
class Hero implements IComponent
{
	public var reactivity:Float;
	public var tile:Entity;
	
	public function new(reactivity:Float)
	{
		this.reactivity = reactivity;
	}
		
}