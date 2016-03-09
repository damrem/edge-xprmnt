package playertile;
import b2d.components.Body;
import box2D.dynamics.B2ContactListener;
import box2D.dynamics.contacts.B2Contact;
import edge.Entity;
import heroes.PlayerCoreComponent;
import hxlpers.edge.EntityStaticExtension;
import maze.components.TileCell;
import maze.components.TileCoreComponent;
import maze.components.TileMovement;
import rendering.components.Layer;
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
		
		var player:Entity = null;
		var tile:Entity=null;
		
		if (fixtureA.isSensor() && entityAIsTile && entityBIsPlayer)
		{
			player = entityB;
			tile = entityA;
		}
		else if (fixtureB.isSensor() && entityBIsTile && entityAIsPlayer)
		{
			player = entityA;
			tile = entityB;
		}
		
		if (player != null && tile != null)
		{
			player.add(new TileEntityRef(tile));
			player.add(tile.getFirstComponentOfType(TileMovement));
			
			var cell = tile.getFirstComponentOfType(TileCell);
			player.removeType(Layer);
			player.add(Main.layers.get(cell.y+1, 1));
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