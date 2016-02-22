package b2d.systems;
import b2d.components.ShapedFixtureDef;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class FixtureDefSetShape implements ISystem
{
	public function update(sfd:ShapedFixtureDef)
	{
		
	}
	
	public function updateAdded(e:Entity, node:{ sfd:ShapedFixtureDef }) 
	{
		trace("updateAdded");
		node.sfd.b2FixtureDef.shape = node.sfd.b2Shape;
	}
	
}