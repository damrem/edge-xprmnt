package playertile;
import b2d.components.Body;
import box2D.common.math.B2Vec2;
import de.polygonal.core.math.Mathematics;
import edge.ISystem;
import heroes.PlayerCoreComponent;
import maze.components.Maze;
import maze.components.TileCoreComponent;
import maze.MazeConf;
import maze.UnitConvert;
import edge.Entity;
/**
 * ...
 * @author damrem
 */
class MovePlayerWithTile implements ISystem
{
	var pos:B2Vec2;
	var entity:Entity;
	
	public function update(tile:TileCoreComponent, body:Body, playerBody:PlayerBody)
	{
		tilePos = body.b2Body.getPosition();
		playerPos = playerBody.body.b2Body.getPosition();
		playerPos.set
		
		playerBody.body.b2Body.setPosition(
	}
	
}