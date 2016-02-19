package b2d.systems;
import b2d.components.BodyComponent;
import b2d.components.BodyDefComponent;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class CreateBodyFromDef implements ISystem
{

	public function update(bodyDef:BodyDefComponent, bodyComponent:BodyComponent) 
	{
		
	}
	
	public function updateAdded(e:Entity, n: { bodyDef:BodyDefComponent, bodyComponent:BodyComponent } )
	{
		trace("updateAdded");
		n.bodyComponent.b2body = B2.world().createBody(n.bodyDef.bodyDef);
	}
	
}