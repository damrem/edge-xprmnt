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
/**
 * ...
 * @author damrem
 */
class MovePlayerWithTile implements ISystem
{
	var playerVel:B2Vec2;
	var entity:Entity;
	var tileVel:B2Vec2;
	
	public function update(player:PlayerCoreComponent, playerBody:Body, tileBodyRef:TileBodyRef)
	{
		tileVel = tileBodyRef.body.b2Body.getLinearVelocity();
		if (tileVel.length() > 0)
		{
			//trace(tileVel);
			playerBody.b2Body.setAwake(true);
			playerVel = playerBody.b2Body.getLinearVelocity();
			playerVel.add(tileVel);
			playerBody.b2Body.setLinearVelocity(playerVel);			
		}
		/*
		tilePos = body.b2Body.getPosition();
		playerPos = playerBody.body.b2Body.getPosition();
		playerPos.
		
		playerBody.body.b2Body.setPosition(
		trace(movement.dx, movement.dy);
		*/
	}
	
	public function udpateAdded(entity:Entity, node: { tile:PlayerCoreComponent, body:Body, movement:TileMovement, tileBodyRef:TileBodyRef } )
	{
		trace("updateAdded");
	}
	
}