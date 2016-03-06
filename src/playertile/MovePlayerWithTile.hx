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
	
	public function update(player:PlayerCoreComponent, playerBody:Body, tileEntityRef:TileEntityRef)
	{
		var tileEntity = tileEntityRef.tile;
		var tileMovement = tileEntity.getFirstComponentOfType(TileMovement);
		if (tileMovement == null)
		{
			return;
		}
		var tileBody = tileEntity.getFirstComponentOfType(Body);
		
		//tileVel = tileBody.b2Body.getLinearVelocity();
		trace(tileMovement.dx, tileMovement.dy);
		
		
		playerBody.b2Body.setAwake(true);
		/*
		playerVel = playerBody.b2Body.getLinearVelocity();
		playerVel.add(tileVel);
		playerBody.b2Body.setLinearVelocity(playerVel);			
		*/
		var playerPos = playerBody.b2Body.getPosition();
		//trace(tileVel.x, tileVel.y);
		playerPos.set(playerPos.x + tileMovement.dx, playerPos.y + tileMovement.dy);
		playerBody.b2Body.setPosition(playerPos);
		
		/*
		tilePos = body.b2Body.getPosition();
		playerPos = playerBody.body.b2Body.getPosition();
		playerPos.
		
		playerBody.body.b2Body.setPosition(
		trace(movement.dx, movement.dy);
		*/
	}
	
	public function udpateAdded(entity:Entity, node: { player:PlayerCoreComponent, playerBody:Body, tileBodyRef:TileEntityRef, tileMovement:TileMovement } )
	{
		trace("updateAdded");
	}
	
}