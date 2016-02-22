package b2d.systems;
import b2d.components.Body;
import b2d.components.ShapedFixtureDef;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class BodyCreateFixture implements ISystem
{

	public function update(fd:ShapedFixtureDef, b:Body) 
	{
		
	}
	
	public function updateAdded(e:Entity, n: { fd:ShapedFixtureDef, b:Body } )
	{
		trace("updateAdded");
		n.b.b2Body.createFixture(n.fd.b2FixtureDef);
	}
	
}