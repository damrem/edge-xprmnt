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
		
		if ((Math.abs(dx) == 0 && Math.abs(dy) == 0) || (Math.abs(dx) > Math.abs(tileMovement.dx) || Math.abs(dy) > Math.abs(tileMovement.dy)))
		{
			//trace("ending movement");
			entity.remove(tileMovement);
		}
		
		tileMovement.dx = dx;
		tileMovement.dy = dy;
		//trace(body.b2Body.getLinearVelocity().toString());
	}
	
	public function updateAdded(entity:Entity, node:{tileDef:TileCoreComponent, body:Body, tileMovement:TileMovement}) 
	{
		//trace("updateAdded");
		
		node.body.b2Body.setAwake(true);
		var fromPosition = node.body.b2Body.getPosition();
		var dx = UnitConvert.posXfromCellX(node.tileMovement.toCell.x) - fromPosition.x;
		var dy = UnitConvert.posYfromCellY(node.tileMovement.toCell.y) - fromPosition.y;
		
		var v = new B2Vec2(dx / 1000, dy / 1000);
		node.body.b2Body.setLinearVelocity(v);
		//trace("added" + node.body.b2Body.getLinearVelocity().toString());
		//trace(node.body.b2Body.max
	}
	
	public function updateRemoved(entity:Entity, node:{tileDef:TileCoreComponent, body:Body, tileMovement:TileMovement})
	{
		//trace("updateRemoved");
		node.body.b2Body.setLinearVelocity(new B2Vec2());
		node.body.b2Body.setPosition(new B2Vec2(node.tileMovement.toX(), node.tileMovement.toY()));
		node.body.b2Body.setAwake(false);
		
		//entity.
		
		//trace(node.tileMovement);
		if (node.tileMovement.isOut)
		{
			//trace("isOut");
			entity.removeTypes([TileCoreComponent, Body, Entity]);
			entity.destroy();
		}
		
	}
	
	
	
}