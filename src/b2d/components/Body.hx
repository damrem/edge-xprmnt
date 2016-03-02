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
	public function new(bodyDef:BodyDef)
	{
		b2BodyDef = new B2BodyDef();
		b2BodyDef.position.set(bodyDef.x, bodyDef.y);
		if (bodyDef.type != null)
		{
			b2BodyDef.type = bodyDef.type;
		}
		if (bodyDef.linearDamping != null)
		{
			b2BodyDef.linearDamping = bodyDef.linearDamping;
		}
		
		if (bodyDef.fixedRotation != null)
		{
			b2BodyDef.fixedRotation = bodyDef.fixedRotation;
		}
		
	}
	
	public function toString():String
	{
		return "Body";
	}
}

typedef BodyDef = {
	@:optional var fixedRotation:Bool;
	@:optional var linearDamping:Float;
	@:optional var type:B2BodyType;
	@:optional var x:Float;
	@:optional var y:Float;
}