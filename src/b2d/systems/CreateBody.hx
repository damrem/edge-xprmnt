package b2d.systems;
import b2d.components.Body;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class CreateBody implements ISystem
{

	public function update(body:Body) 
	{
		
	}
	
	public function updateAdded(entity:Entity, node: { body:Body } )
	{
		//trace("updateAdded");
		node.body.b2Body = B2.world.createBody(node.body.b2BodyDef);
		node.body.b2Body.setUserData(entity);
	}
	
	public function updateRemoved(entity:Entity, node: { body:Body } )
	{
		//trace("updateRemoved");
		B2.world.destroyBody(node.body.b2Body);
	}
	
}