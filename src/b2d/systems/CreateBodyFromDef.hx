package b2d.systems;
import b2d.components.Body;
import b2d.components.BodyDef;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class CreateBodyFromDef implements ISystem
{

	public function update(bd:BodyDef, b:Body) 
	{
		
	}
	
	public function updateAdded(e:Entity, n: { bd:BodyDef, b:Body } )
	{
		trace("updateAdded");
		n.b.b2Body = B2.world.createBody(n.bd.b2BodyDef);
	}
	
}