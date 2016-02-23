package maze.systems;

import ash.core.Entity;
import ash.tools.ListIteratingSystem;
import de.polygonal.ds.Array2.Array2Cell;
import edge.ISystem;
import hxlpers.Direction;
import labyrinth.movement.TileMovementComponent;
import maze.components.Maze;
import maze.components.MazeMovement;

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
		super(MovingMazeNode, nodeUpdate, nodeAdded);
		destCell = new Array2Cell();
	}
	
	public function update(maze:Maze, movement:MazeMovement) 
	{
		
	}
	
	function updateAdded(entity:Entity, node:{maze:Maze, movement:MazeMovement}) 
	{
		var movingTileEntities:Array<Array<{}>> = [];
		//var originCell;
		
		if (node.movement.direction == Direction.Left || node.movement.direction == Direction.Right)
		{
			movingTileEntities = node.maze.tiles.getRow(node.movement.coord, movingTileEntities);
		}
		else if (node.movement.direction == Direction.Up || node.movement.direction == Direction.Down)
		{
			movingTileEntities = node.maze.tiles.getCol(movingMazeNode.movement.coord, movingTileEntities);
		}
		
		for (tileEntity in movingTileEntities)
		{
			
			///???
			tileEntity.
			var tileComponent = cast(tileEntity.get(TileComponent), TileComponent);
			tileComponent.cell = movingMazeNode.maze.tiles.cellOf(tileEntity, tileComponent.cell);
			
		}
		
		movingMazeNode.maze.tiles.move(movingMazeNode.movement.coord, movingMazeNode.movement.coord, movingMazeNode.movement.direction);
		
		for (tileEntity in movingTileEntities)
		{
			var destCell = movingMazeNode.maze.tiles.cellOf(tileEntity, destCell);
			
			tileEntity.add(new TileMovementComponent(destCell));
			
		}
	}
	
}