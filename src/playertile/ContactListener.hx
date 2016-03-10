package playertile;
import b2d.components.Body;
import box2D.dynamics.B2ContactListener;
import box2D.dynamics.contacts.B2Contact;
import edge.Entity;
import heroes.PlayerCoreComponent;
import hxlpers.edge.EntityStaticExtension;
import maze.components.TileCoreComponent;
import maze.components.TileMovement;
import rendering.components.Opacity;

using hxlpers.edge.EntityStaticExtension;

/**
 * ...
 * @author damrem
 */
class ContactListener extends B2ContactListener
{

	public function new() 
	{
		super();
	}
	
	override public function beginContact(contact:B2Contact)
	{
		var fixtureA = contact.getFixtureA();
		var entityA = cast(fixtureA.getUserData(), Entity);
		var entityAIsPlayer = entityA.existsType(PlayerCoreComponent);
		var entityAIsTile = entityA.existsType(TileCoreComponent);
		
		var fixtureB = contact.getFixtureB();
		var entityB = cast(fixtureB.getUserData(), Entity);
		var entityBIsPlayer = entityB.existsType(PlayerCoreComponent);
		var entityBIsTile = entityB.existsType(TileCoreComponent);
		
		if (fixtureA.isSensor() && entityAIsTile && entityBIsPlayer)
		{
			//entityA.add(new Opacity(0.5));
			entityB.add(new TileEntityRef(entityA));
			entityB.add(entityA.getFirstComponentOfType(TileMovement));
		}
		else if (fixtureB.isSensor() && entityBIsTile && entityAIsPlayer)
		{
			//entityB.add(new Opacity(0.5));
			entityA.add(new TileEntityRef(entityB));
			entityA.add(entityB.getFirstComponentOfType(TileMovement));
		}
		
	}
	
	override public function endContact(contact:B2Contact)
	{
		var fixtureA = contact.getFixtureA();
		var entityA = cast(fixtureA.getUserData(), Entity);
		var entityAIsPlayer = entityA.existsType(PlayerCoreComponent);
		var entityAIsTile = entityA.existsType(TileCoreComponent);
		
		var fixtureB = contact.getFixtureB();
		var entityB = cast(fixtureB.getUserData(), Entity);
		var entityBIsPlayer = entityB.existsType(PlayerCoreComponent);
		var entityBIsTile = entityB.existsType(TileCoreComponent);
		
		if (fixtureA.isSensor() && entityAIsTile && entityBIsPlayer)
		{
			entityA.removeType(Opacity);
			entityB.removeType(TileEntityRef);
			entityB.removeType(TileMovement);
		}
		else if (fixtureB.isSensor() && entityBIsTile && entityAIsPlayer)
		{
			entityB.removeType(Opacity);
			entityA.removeType(TileEntityRef);
			entityA.removeType(TileMovement);
		}
	}
	
}