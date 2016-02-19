package b2d.systems;
import b2d.components.BodyComponent;
import b2d.components.FixtureDefComponent;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class BodyCreateFixture implements ISystem
{

	public function update(fixtureDefComponent:FixtureDefComponent, bodyComponent:BodyComponent) 
	{
		
	}
	
	public function updateAdded(e:Entity, n: { fixtureDefComponent:FixtureDefComponent, bodyComponent:BodyComponent } )
	{
		trace("updateAdded");
		n.bodyComponent.b2body.createFixture(n.fixtureDefComponent.fixtureDef);
	}
	
}