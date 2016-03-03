package heroes;
import b2d.components.Body;
import box2D.common.math.B2Vec2;
import de.polygonal.core.math.Mathematics;
import edge.ISystem;
import maze.components.Maze;
import maze.MazeConf;
import maze.UnitConvert;

/**
 * ...
 * @author damrem
 */
class UpdatePlayerTile implements ISystem
{
	var pos:B2Vec2;
	public function update(body:Body, hero:Hero, maze:Maze)
	{
		pos = body.b2Body.getPosition();
		//trace(, );
		
		hero.tile = maze.tiles.get(Mathematics.clamp(UnitConvert.cellXfromPosX(pos.x), 0, MazeConf.WIDTH-1), Mathematics.clamp(UnitConvert.cellYfromPosY(pos.y), 0, MazeConf.HEIGHT-1));
	}
	
}