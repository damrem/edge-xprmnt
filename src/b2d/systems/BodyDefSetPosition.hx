package b2d.systems;
import b2d.components.BodyDef;
import b2d.components.Position;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class BodyDefSetPosition implements ISystem
{

	public function update(bd:BodyDef, pos:Position) 
	{
		
	}
	
	public function updateAdded(e:Entity, n: { bd:BodyDef, pos:Position } )
	{
		trace("updateAdded");
		n.bd.b2BodyDef.position.set(n.pos.x, n.pos.x);
	}
	
}