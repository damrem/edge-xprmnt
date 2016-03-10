package playertile;
import b2d.components.Body;
import box2D.common.math.B2Vec2;
import de.polygonal.core.math.Mathematics;
import edge.ISystem;
import heroes.PlayerCoreComponent;
import maze.components.Maze;
import maze.components.TileCoreComponent;
import maze.components.TileMovement;
import maze.MazeConf;
import maze.UnitConvert;
import edge.Entity;
import rendering.components.Opacity;

using hxlpers.edge.EntityStaticExtension;
/**
 * ...
 * @author damrem
 */
class MovePlayerWithTile implements ISystem
{
	var playerVel:B2Vec2;
	var entity:Entity;
	var tileVel:B2Vec2;
	var c:Int = 0;
	public function update(player:PlayerCoreComponent, playerBody:Body, tileEntityRef:TileEntityRef)
	{
		
		var tileEntity = tileEntityRef.tile;
		var tileMovement = tileEntity.getFirstComponentOfType(TileMovement);
		tileEntity.removeType(Opacity);
		tileEntity.add(new Opacity(Math.random()));
		if (tileMovement == null)
		{
			return;
		}
		trace("update", c++);
		//playerBody.b2Body.setAwake(true);
		var tileBody:Body = tileEntity.getFirstComponentOfType(Body);
		//var mass = 1;//playerBody.b2Body.getMass()/10;
		//trace(mass);
		tileVel = tileBody.b2Body.getLinearVelocity();
		//trace(tileVel.x, tileVel.y);
		//tileVel.set(tileVel.x * mass, tileVel.y * mass);
		//trace(tileVel.x, tileVel.y);
		//trace(tileMovement.dx, tileMovement.dy);
		
		
		
		//playerVel = playerBody.b2Body.getLinearVelocity();
		//playerVel.add(tileVel);
		playerBody.b2Body.setLinearVelocity(tileVel);
		
		//playerBody.b2Body.applyForce(tileVel, playerBody.b2Body.getWorldCenter());
		
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