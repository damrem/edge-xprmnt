package playertile;
import b2d.components.Body;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import edge.Entity;
import edge.ISystem;
import heroes.PlayerCoreComponent;
import maze.components.TileMovement;
import openfl.display.FPS;
import rendering.components.Opacity;

using hxlpers.edge.EntityStaticExtension;
/**
 * ...
 * @author damrem
 */
class MovePlayerWithTile implements ISystem
{
	var timeDelta:Float;
	var playerVel:B2Vec2;
	var entity:Entity;
	var tileForce:B2Vec2;
	var c:Int = 0;
	public function update(player:PlayerCoreComponent, playerBody:Body, tileEntityRef:TileEntityRef)
	{
		//trace(playerBody.b2Body.getLinearVelocity().length()*1000);
		var tileEntity = tileEntityRef.tile;
		var tileMovement = tileEntity.getFirstComponentOfType(TileMovement);
		
		
		
		if (tileMovement == null)
		{
			return;
		}
		
		//DEBUG
		//trace('plop');
		if(tileEntity.existsType(Opacity))	tileEntity.removeType(Opacity);
		tileEntity.add(new Opacity(Math.random()));
		//!DEBUG
		
		
		/*if (!playerBody.b2Body.isAwake())	*/
		
		
		var tileBody:Body = tileEntity.getFirstComponentOfType(Body);
		var mass = playerBody.b2Body.getMass();
		trace(mass);
		tileForce = tileBody.b2Body.getLinearVelocity().copy();
		trace(tileForce.x);
		
		//tileForce.multiply(Math.sqrt(mass));
		//tileForce.multiply(mass);
		//tileForce.multiply(1000/timeDelta);
		//tileForce.multiply(timeDelta);
		trace(playerBody.b2Body.getLinearVelocity().x);
		playerBody.b2Body.applyForce(tileForce, playerBody.b2Body.getWorldCenter());
		
		
	}
	/*
	public function updateAdded(entity:Entity, node: { player:PlayerCoreComponent, playerBody:Body, tileEntityRef:TileEntityRef } )
	{
		trace("updateAdded");
		
		var tileB2Body:B2Body = node.tileEntityRef.tile.getFirstComponentOfType(Body).b2Body;
		var playerB2Body = node.playerBody.b2Body;
		var tileVelocity = tileB2Body.getLinearVelocity();
		trace(tileVelocity.x);
		playerB2Body.setAwake(true);
		playerB2Body.getLinearVelocity().add(tileVelocity);
		trace(playerB2Body.getLinearVelocity().x);
		//node.playerBody.b2Body.setLinearDamping(0);
	}
	
	public function updateRemoved(entity:Entity, node: { player:PlayerCoreComponent, playerBody:Body, tileEntityRef:TileEntityRef } )
	{
		trace("udpateRemoved");
		//node.playerBody.b2Body.setLinearDamping(0.5);
	}
	*/
}