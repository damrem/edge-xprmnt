package maze.systems;

import b2d.components.Body;
import b2d.components.Impulse;
import box2D.common.math.B2Vec2;
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
	
	public function update(tileDef:TileCoreComponent, body:Body, tileMovement:TileMovement) 
	{
		var dx = body.b2Body.getPosition().x - tileMovement.toX();
		var dy = body.b2Body.getPosition().y - tileMovement.toY();
		
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
		
		var toCell = node.tileMovement.toCell;
		var b2Body = node.body.b2Body;
		
		var fromPosition = b2Body.getPosition();
		var toPositionX = UnitConvert.posXfromCellX(toCell.x);
		var toPositionY = UnitConvert.posYfromCellY(toCell.y);
		
		var dx = toPositionX - fromPosition.x;
		var dy = toPositionY - fromPosition.y;
		
		var v = new B2Vec2(dx, dy);
		
		b2Body.setAwake(true);
		b2Body.setLinearVelocity(v);
	}
	
	public function updateRemoved(entity:Entity, node:{tileDef:TileCoreComponent, body:Body, tileMovement:TileMovement})
	{
		trace("updateRemoved");
		
		var b2Body = node.body.b2Body;
		var movement = node.tileMovement;
		
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