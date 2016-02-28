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

	public function update(b:Body) 
	{
		
	}
	
	public function updateAdded(e:Entity, n: { b:Body } )
	{
		trace("updateAdded");
		n.b.b2Body = B2.world.createBody(n.b.b2BodyDef);
	}
	
}