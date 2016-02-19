package b2d.systems;
import b2d.components.BodyDefComponent;
import b2d.components.PositionComponent;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class BodyDefSetPosition implements ISystem
{

	public function update(bodyDef:BodyDefComponent, position:PositionComponent) 
	{
		
	}
	
	public function updateAdded(entity:Entity, node: { bodyDef:BodyDefComponent, position:PositionComponent } )
	{
		trace("updateAdded");
		node.bodyDef.bodyDef.position.set(node.position.x, node.position.x);
	}
	
}