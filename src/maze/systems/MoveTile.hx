package maze.systems;

import b2d.components.Body;
import box2D.common.math.B2Vec2;
import de.polygonal.ds.Array2.Array2Cell;
import edge.Entity;
import edge.ISystem;
import edge.View;
import maze.components.TileDef;
import maze.components.Maze;
import maze.components.TileMovement;
import motion.Actuate;

using hxlpers.ds.Array2SF;

/**
 * ...
 * @author damrem
 */
class MoveTile implements ISystem
{
	public function update(tileDef:TileDef, body:Body, tileMovement:TileMovement) 
	{
		trace("update");
		body.b2Body.setPosition(tileMovement.position);
		//movingTileNode.physical.body.setPosition(movingTileNode.tileMovement.position);
	}
	
	public function updateAdded(entity:Entity, node:{tileDef:TileDef, body:Body, tileMovement:TileMovement}) 
	{
		trace("updateAdded");
		
		var cell = node.tileDef.cell;
		
		node.tileMovement.position = new B2Vec2(UnitConvert.posXfromCellX(cell.x), UnitConvert.posYfromCellY(cell.y));
		
		Actuate
		.tween(node.tileMovement.position, 2.0, { 
			x:UnitConvert.posXfromCellX(cell.x), 
			y:UnitConvert.posYfromCellY(cell.y) 
		} )
		.onComplete(tweenEnded, [entity, node.tileMovement]);
		
	}
	
	function tweenEnded(entity:Entity, tileMovement:TileMovement)
	{
		trace("removeMovement", entity, tileMovement);
		entity.remove(tileMovement);
	}
	
	
	
	
	
	
	
	
	
}