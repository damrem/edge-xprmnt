package b2d.components;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2BodyType;
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
	public function new(bodyDefDef:BodyDefDef)
	{
		b2BodyDef = new B2BodyDef();
		b2BodyDef.position.set(bodyDefDef.x, bodyDefDef.y);
		if (bodyDefDef.type != null)
		{
			b2BodyDef.type = bodyDefDef.type;			
		}
	}
	
	public function toString():String
	{
		return "Body";
	}
}

typedef BodyDefDef = {
	@:optional var type:B2BodyType;
	@:optional var x:Float;
	@:optional var y:Float;
}