package b2d.systems;
import b2d.components.FixtureDefComponent;
import b2d.components.ShapeComponent;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class FixtureDefSetShape implements ISystem
{
	public function update(fd:FixtureDefComponent, sh:ShapeComponent)
	{
		
	}
	
	public function updateAdded(e:Entity, n:{ fd:FixtureDefComponent, sh:ShapeComponent }) 
	{
		trace("updateAdded");
		n.fd.fixtureDef.shape = n.sh.shape;
	}
	
}