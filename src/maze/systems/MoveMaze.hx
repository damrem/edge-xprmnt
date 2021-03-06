package maze.systems;



import de.polygonal.ds.Array2.Array2Cell;
import edge.Engine;
import edge.Entity;
import edge.ISystem;
import edge.View;
import hxlpers.Direction;
import maze.components.Maze;
import maze.components.MazeMovement;
import maze.components.TileCoreComponent;
import maze.components.TileMovement;
import maze.factories.TileFactory;

using hxlpers.ds.Array2SF;
//using hxlpers.edge.ComponentArraySF;
/**
 * ...
 * @author damrem
 */
class MoveMaze implements ISystem
{
	var engine:Engine;
	
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
		//trace("updateAdded", node.movement.coord);
		
		var movingTileEntities:Array<Entity> = [];
		//var originCell;
		
		
		if (node.movement.direction == Direction.Left || node.movement.direction == Direction.Right)
		{
			movingTileEntities = node.maze.tiles.getRow(node.movement.coord, movingTileEntities);
		}
		else if (node.movement.direction == Direction.Up || node.movement.direction == Direction.Down)
		{
			movingTileEntities = node.maze.tiles.getCol(node.movement.coord, movingTileEntities);
		}
		
		var insertedFromX:Int;
		var insertedFromY:Int;

		var outteredToX:Int;
		var outteredToY:Int;
		
		switch(node.movement.direction)
		{
			case Direction.None:
				insertedFromX = 10;
				insertedFromY = 10;
				outteredToX = 10;
				outteredToY = 10;
				
			case Direction.Left:
				insertedFromX = MazeConf.WIDTH;
				insertedFromY = node.movement.coord;
				outteredToX = -1;
				outteredToY = node.movement.coord;
				
			case Direction.Up:
				insertedFromX = node.movement.coord;
				insertedFromY = MazeConf.HEIGHT;
				outteredToX = node.movement.coord;
				outteredToY = -1;
				
			case Direction.Right:
				insertedFromX = -1;
				insertedFromY = node.movement.coord;
				outteredToX = MazeConf.WIDTH;
				outteredToY = node.movement.coord;
				
			case Direction.Down:
				insertedFromX = node.movement.coord;
				insertedFromY = -1;
				outteredToX = node.movement.coord;
				outteredToY = MazeConf.HEIGHT;
		}
		
		
		var replacingTileEntity = TileFactory.createEntity(engine, insertedFromX, insertedFromY);
		//var replacingTileEntity = engine.create(replacingTile);
		//replacingTile.push(replacingTileEntity);
		movingTileEntities.push(replacingTileEntity);
		//trace("movingTiles"+ movingTiles);
		
		var replacedTile = node.maze.tiles.move(node.movement.coord, node.movement.coord, node.movement.direction, replacingTileEntity);
		
		for (movingTile in movingTileEntities)
		{
			var isOut:Bool;
			if (movingTile == replacedTile)
			{
				//trace("out");
				destCell = new Array2Cell(outteredToX, outteredToY);
				isOut = true;
			}
			else
			{
				//trace("in");
				destCell = node.maze.tiles.getCellOf(movingTile);
				isOut = false;
			}
			
			//for (component in movingTile)
			//{
				//if (Type.getClass(component) == Entity)
				//{
					//cast(component, Entity).add(new TileMovement(destCell, isOut));
					movingTile.add(new TileMovement(destCell, isOut, node.movement.direction));
					//break;
				//}
			//}
		}
	}
	
}