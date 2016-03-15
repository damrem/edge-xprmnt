package playertile;
import b2d.components.Body;
import box2D.common.math.B2Vec2;
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
		if(tileEntity.existsType(Opacity))	tileEntity.removeType(Opacity);
		tileEntity.add(new Opacity(Math.random()));
		//!DEBUG
		
		
		/*if (!playerBody.b2Body.isAwake())	*/
		
		
		var tileBody:Body = tileEntity.getFirstComponentOfType(Body);
		var mass = playerBody.b2Body.getMass();
		tileForce = tileBody.b2Body.getLinearVelocity().copy();
		
		//tileForce.multiply(Math.sqrt(mass));
		
		tileForce.multiply(timeDelta/1000);
		
		//playerBody.b2Body.setAwake(true);
		playerBody.b2Body.applyForce(tileForce, playerBody.b2Body.getWorldCenter());
		
		//trace(tileForce.x, playerBody.b2Body.getLinearVelocity().x);
		
		
		/*
		var force = tileBody.b2Body.getLinearVelocity();
		var mass = playerBody.b2Body.getMass();
		force.x *= mass / 2;
		force.y *= mass / 2;
		playerBody.b2Body.applyImpulse(force, playerBody.b2Body.getWorldCenter());
		*/
		/*
		var playerPos = playerBody.b2Body.getPosition();
		//trace(tileVel.x, tileVel.y);
		//playerPos.set(playerPos.x + tileMovement.dx, playerPos.y + tileMovement.dy);
		trace(tileBody.b2Body.getLinearVelocity().x, tileBody.b2Body.getLinearVelocity().y);
		playerPos.add(tileBody.b2Body.getLinearVelocity());
		trace(playerPos.x, playerPos.y);
		playerBody.b2Body.setPosition(playerPos);
		*/
		/*
		tilePos = body.b2Body.getPosition();
		playerPos = playerBody.body.b2Body.getPosition();
		playerPos.
		
		playerBody.body.b2Body.setPosition(
		trace(movement.dx, movement.dy);
		*/
	}
	
	public function udpateAdded(entity:Entity, node: { player:PlayerCoreComponent, playerBody:Body, tileEntityRef:TileEntityRef } )
	{
		trace("updateAdded");
	}
	
}