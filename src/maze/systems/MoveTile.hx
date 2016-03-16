package maze.systems;

import b2d.components.Body;
import b2d.components.Impulse;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2TimeStep;
import de.polygonal.ds.Array2.Array2Cell;
import edge.Entity;
import edge.ISystem;
import edge.View;
import maze.components.TileCoreComponent;
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
	
	var toCell:Array2Cell;
	var b2Body:B2Body;
	var movement:TileMovement;
	var fromPosition:B2Vec2;
	var toPositionX:Float;
	var toPositionY:Float;
	var velocity:B2Vec2;
	
	public function update(tileDef:TileCoreComponent, body:Body, tileMovement:TileMovement) 
	{
		var dx = tileMovement.toX() - body.b2Body.getPosition().x;
		var dy = tileMovement.toY() - body.b2Body.getPosition().y;
		
		if (
			(Math.abs(dx) == 0 && Math.abs(dy) == 0) 
			|| 
			((tileMovement.direction==Left||tileMovement.direction==Right) && Math.abs(dx) > Math.abs(tileMovement.dx))
			|| 
			((tileMovement.direction==Up||tileMovement.direction==Down) && Math.abs(dy) > Math.abs(tileMovement.dy))
			
		)
		{
			//trace("ending movement");
			entity.remove(tileMovement);
		}
		
		tileMovement.dx = dx;
		tileMovement.dy = dy;
	}
	
	public function updateAdded(entity:Entity, node:{tileDef:TileCoreComponent, body:Body, tileMovement:TileMovement}) 
	{
		trace("updateAdded");
		
		toCell = node.tileMovement.toCell;
		b2Body = node.body.b2Body;
		
		fromPosition = b2Body.getPosition();
		toPositionX = UnitConvert.posXfromCellX(toCell.x);
		toPositionY = UnitConvert.posYfromCellY(toCell.y);
		
		var dx = toPositionX - fromPosition.x;
		var dy = toPositionY - fromPosition.y;
		
		velocity = new B2Vec2(dx, dy);
		
		b2Body.setAwake(true);
		b2Body.setLinearVelocity(velocity);
	}
	
	public function updateRemoved(entity:Entity, node:{tileDef:TileCoreComponent, body:Body, tileMovement:TileMovement})
	{
		trace("updateRemoved");
		
		b2Body = node.body.b2Body;
		movement = node.tileMovement;
		
		b2Body.setLinearVelocity(new B2Vec2());
		b2Body.setPosition(new B2Vec2(movement.toX(), movement.toY()));
		b2Body.setAwake(false);
		
		if (movement.isOut)
		{
			entity.removeTypes([TileCoreComponent, Body, Entity]);
			entity.destroy();
		}
		
	}
	
	
	
}