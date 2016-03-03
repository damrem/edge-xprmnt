package playertile;
import box2D.dynamics.B2ContactListener;
import box2D.dynamics.contacts.B2Contact;
import edge.Entity;
import heroes.PlayerCoreComponent;
import maze.components.TileCoreComponent;
import rendering.components.Opacity;

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
		var entityAIsPlayer = entityA.existsType(PlayerCoreComponent) == true;
		var fixtureB = contact.getFixtureB();
		var entityB = cast(fixtureB.getUserData(), Entity);
		var entityBIsPlayer = entityB.existsType(PlayerCoreComponent) == true;
		
		if (fixtureA.isSensor() && entityBIsPlayer)
		{
			entityA.add(new Opacity(0.5));
		}
		else if (fixtureB.isSensor() && entityAIsPlayer)
		{
			entityB.add(new Opacity(0.5));
		}
		/*
		trace("beginContact");
		if(contact.getFixtureA().isSensor && cast(contact.getFixtureA().getUserData(), 
		trace(contact.getFixtureA().getUserData());
		trace(contact.getFixtureB().getUserData());*/
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
		}
		else if (fixtureB.isSensor() && entityBIsTile && entityAIsPlayer)
		{
			entityB.removeType(Opacity);
		}
	}
	
}