package b2d.systems;
import b2d.components.FixtureDef;
import b2d.components.Shape;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class FixtureDefSetShape implements ISystem
{
	public function update(fd:FixtureDef, sh:Shape)
	{
		
	}
	
	public function updateAdded(e:Entity, n:{ fd:FixtureDef, sh:Shape }) 
	{
		trace("updateAdded");
		n.fd.b2FixtureDef.shape = n.sh.b2Shape;
	}
	
}