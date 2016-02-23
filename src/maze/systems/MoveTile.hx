package maze.systems;

import b2d.components.Body;
import box2D.common.math.B2Vec2;
import de.polygonal.ds.Array2.Array2Cell;
import edge.Entity;
import edge.ISystem;
import edge.View;
import maze.components.Aperture;
import maze.components.Maze;
import maze.components.TileMovement;
import motion.Actuate;

/**
 * ...
 * @author damrem
 */
class MoveTile implements ISystem
{
	var mazeNodes:View<{maze:Maze}>;
	
	public function update(body:Body, movement:TileMovement) 
	{
		body.b2Body.setPosition(tileMovement.position);
		//movingTileNode.physical.body.setPosition(movingTileNode.movement.position);
	}
	
	public function updateAdded(entity:Entity, node:{body:Body, movement:TileMovement}) 
	{
		for (mazeNode in mazeNodes)
		{
			trace("mazeNode", mazeNode);
			
			var cell:Array2Cell = new Array2Cell();
			mazeNode.maze.tiles.cellOf(entity, cell);
			
			node.movement.position = new B2Vec2(UnitConvert.posXfromCellX(movingTileNode.tile.cell.x), UnitConvert.posYfromCellY(movingTileNode.tile.cell.y));
			
			Actuate
			.tween(node.movement.position, 2.0, { 
				x:UnitConvert.posXfromCellX(cell.x), 
				y:UnitConvert.posYfromCellY(cell.y) 
			} )
			.onComplete(tweenEnded, [entity, node.movement]);
		}
	}
	
	function tweenEnded(entity:Entity, movement:TileMovement)
	{
		trace("removeMovement", entity, movement);
		entity.remove(movement);
	}
	
	
	
	
	
	
	
	
	
}