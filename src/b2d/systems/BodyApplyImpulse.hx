package b2d.systems;
import b2d.components.Body;
import b2d.components.Impulse;
import box2D.common.math.B2Vec2;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class BodyApplyImpulse implements ISystem
{
	var b2vec2:B2Vec2;
	var mass:Float;
	
	public function new()
	{
		b2vec2 = new B2Vec2();
	}
	
	public function update(body:Body, impulse:Impulse) 
	{
		
	}
	
	public function updateAdded(entity:Entity, node: { body:Body, impulse:Impulse } )
	{
		//trace("updateAdded");
		
		mass = node.body.b2Body.getMass();
		b2vec2.x = mass * node.impulse.x;
		b2vec2.y = mass * node.impulse.y;
		node.body.b2Body.applyImpulse(b2vec2, node.body.b2Body.getWorldCenter());
		entity.remove(node.impulse);
	}
	
}