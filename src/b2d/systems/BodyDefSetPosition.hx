package b2d.systems;
import b2d.components.Body;
import b2d.components.Position;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class BodyDefSetPosition implements ISystem
{

	public function update(body:Body, pos:Position) 
	{
		
	}
	
	public function updateAdded(e:Entity, node: { body:Body, pos:Position } )
	{
		trace("updateAdded");
		node.body.b2BodyDef.position.set(node.pos.x, node.pos.y);
	}
	
}