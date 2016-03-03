package playertile;
import b2d.components.Body;
import box2D.common.math.B2Vec2;
import de.polygonal.core.math.Mathematics;
import edge.ISystem;
import heroes.Player;
import maze.components.Maze;
import maze.components.TileDef;
import maze.MazeConf;
import maze.UnitConvert;
import edge.Entity;
/**
 * ...
 * @author damrem
 */
class UpdateTilePlayer implements ISystem
{
	var pos:B2Vec2;
	var entity:Entity;
	
	public function update(body:Body, player:Player, maze:Maze)
	{
		pos = body.b2Body.getPosition();
		//trace(, );
		
		var tileEntity:Entity = maze.tiles.get(Mathematics.clamp(UnitConvert.cellXfromPosX(pos.x), 0, MazeConf.WIDTH - 1), Mathematics.clamp(UnitConvert.cellYfromPosY(pos.y), 0, MazeConf.HEIGHT - 1));
		var playerEntity = entity;
		
		/*
		if (playerEntity.existsType(TileEntityRef))
		{
			if(playerEntity.
		}
		
		
		if (!tileEntity.exists(entity))
		{
			if (tileEntity.existsType(PlayerEntityRef)
			{
				tileEntity.removeType(PlayerEntityRef);
			}
			tileEntity.add(new PlayerEntityRef(entity));
		}
		*/
	}
	
}