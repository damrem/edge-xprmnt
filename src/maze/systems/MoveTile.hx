package maze.systems;

import b2d.components.Body;
import b2d.components.Impulse;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2TimeStep;
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
	var entity:Entity;
	public function update(tileDef:TileDef, body:Body, tileMovement:TileMovement) 
	{
		if (tileMovement.isEnded)
		{
			return;
		}
		//trace("update");
		//body.b2Body.setPosition(tileMovement.position);
		//movingTileNode.physical.body.setPosition(movingTileNode.tileMovement.position);
		var dx = Math.abs(body.b2Body.getPosition().x - tileMovement.toX());
		var dy = Math.abs(body.b2Body.getPosition().y - tileMovement.toY());
		trace(dx, tileMovement.dx);
		if ((dx == 0 && dy == 0) || (dx > tileMovement.dx || dy > tileMovement.dy))
		{
			trace("ending movement");
			tileMovement.isEnded = true;
			entity.remove(tileMovement);
		}
		else
		{
			tileMovement.dx = dx;
			tileMovement.dy = dy;
		}
		//trace(dx, dy);
	}
	
	public function updateAdded(entity:Entity, node:{tileDef:TileDef, body:Body, tileMovement:TileMovement}) 
	{
		trace("updateAdded");
		
		//node.tileMovement.position = node.body.b2Body.getPosition();
		
		/*
		Actuate
		.tween(node.tileMovement.position, 2.0, { 
			x:UnitConvert.posXfromCellX(node.tileMovement.destCell.x), 
			y:UnitConvert.posYfromCellY(node.tileMovement.destCell.y) 
		} )
		.onUpdate(function() {
			node.body.b2Body.getWorld().solve(new B2TimeStep());
		})
		.onComplete(tweenEnded, [entity, node.tileMovement]);
		*/
		//node.body.b2Body.setActive(true);
		node.body.b2Body.setAwake(true);
		//node.body.b2Body.setLinearDamping(10);
		
		var fromPosition=node.body.b2Body.getPosition();
		var dx = UnitConvert.posXfromCellX(node.tileMovement.toCell.x) - fromPosition.x;
		var dy = UnitConvert.posYfromCellY(node.tileMovement.toCell.y) - fromPosition.y;
		
		node.body.b2Body.setLinearVelocity(new B2Vec2(dx/10, dy/10));
		//entity.add(new Impulse(dx, dy));
	}
	
	public function updateRemoved(entity:Entity, node:{tileDef:TileDef, body:Body, tileMovement:TileMovement})
	{
		node.body.b2Body.setLinearVelocity(new B2Vec2());
		node.body.b2Body.setPosition(new B2Vec2(node.tileMovement.toX(), node.tileMovement.toY()));
		node.body.b2Body.setAwake(false);
	}
	
	function tweenEnded(entity:Entity, tileMovement:TileMovement)
	{
		trace("removeMovement", entity, tileMovement);
		entity.remove(tileMovement);
	}
	
	
	
	
	
	
	
	
	
}