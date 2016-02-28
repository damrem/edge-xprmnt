package maze.systems;



import de.polygonal.ds.Array2.Array2Cell;
import edge.Entity;
import edge.ISystem;
import edge.View;
import hxlpers.Direction;
import maze.components.Maze;
import maze.components.MazeMovement;
import maze.components.TileDef;
import maze.components.TileMovement;

using hxlpers.ds.Array2SF;

/**
 * ...
 * @author damrem
 */
class MoveMaze implements ISystem
{
	var destCell:Array2Cell;
	
	public function new() 
	{
		destCell = new Array2Cell();
	}
	
	public function update(maze:Maze, movement:MazeMovement) 
	{
		
	}
	
	public function updateAdded(entity:Entity, node:{maze:Maze, movement:MazeMovement}) 
	{
		trace("updateAdded");
		
		var movingTiles:Array<Array<{}>> = [];
		//var originCell;
		
		if (node.movement.direction == Direction.Left || node.movement.direction == Direction.Right)
		{
			movingTiles = node.maze.tiles.getRow(node.movement.coord, movingTiles);
		}
		else if (node.movement.direction == Direction.Up || node.movement.direction == Direction.Down)
		{
			movingTiles = node.maze.tiles.getCol(node.movement.coord, movingTiles);
		}
		
		trace("movingTiles"+ movingTiles);
		
		
		node.maze.tiles.move(node.movement.coord, node.movement.coord, node.movement.direction);
		
		
		for (movingTile in movingTiles)
		{
			destCell = node.maze.tiles.getCellOf(movingTile);
			for (component in movingTile)
			{
				if (Type.getClass(component) == Entity)
				{
					cast(component, Entity).add(new TileMovement(destCell));
				}
			}
		}
	}
	
}