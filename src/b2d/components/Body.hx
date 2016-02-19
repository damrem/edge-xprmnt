package b2d.components;
import box2D.dynamics.B2Body;
import edge.IComponent;

/**
 * ...
 * @author damrem
 */
class Body implements IComponent
{
	public var b2Body:B2Body;
	
	/**
	 * Empty constructor does not force to pass a B2Body argument,
	 * so that b2Body can be set later.
	 */
	public function new()
	{
		
	}
}