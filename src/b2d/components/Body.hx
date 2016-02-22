package b2d.components;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import edge.IComponent;

/**
 * ...
 * @author damrem
 */
class Body implements IComponent
{
	public var b2Body:B2Body;
	public var b2BodyDef:B2BodyDef;
	
	/**
	 * Empty constructor does not force to pass a B2Body argument,
	 * so that b2Body can be set later.
	 */
	public function new(b2BodyDef:B2BodyDef)
	{
		this.b2BodyDef = b2BodyDef;
		
	}
}