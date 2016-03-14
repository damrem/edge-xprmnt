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
		//trace(body.b2Body.getPosition().x, tileMovement.toX());
		
		var dx = body.b2Body.getPosition().x - tileMovement.toX();
		//trace(body.b2Body.getPosition().x + "+" +body.b2Body.getLinearVelocity().x+" - " + tileMovement.toX());
		var dy = body.b2Body.getPosition().y - tileMovement.toY();
		
		//trace(Math.abs(dx) + " >= " + Math.abs(tileMovement.dx));
		//trace(Math.abs(dy) + " >= " + Math.abs(tileMovement.dy));
		
		//trace((Math.abs(dx) == 0 && Math.abs(dy) == 0) );
		//trace(((tileMovement.dx != 0) + " && " + (Math.abs(dx) >= Math.abs(tileMovement.dx))));
		//trace(((tileMovement.dx != 0) && (Math.abs(dx) >= Math.abs(tileMovement.dx))));
		//trace((tileMovement.dy != 0 && Math.abs(dy) >= Math.abs(tileMovement.dy)));
		
		if (
			(Math.abs(dx) == 0 && Math.abs(dy) == 0) 
			|| 
			((tileMovement.direction==Left||tileMovement.direction==Right) && Math.abs(dx) > Math.abs(tileMovement.dx))
			|| 
			((tileMovement.direction==Up||tileMovement.direction==Down) && Math.abs(dy) > Math.abs(tileMovement.dy))
			
		)
		{
			trace("ending movement");
			entity.remove(tileMovement);
		}
		
		tileMovement.dx = dx;
		tileMovement.dy = dy;
		//trace(body.b2Body.getLinearVelocity().toString());
	}
	
	public function updateAdded(entity:Entity, node:{tileDef:TileCoreComponent, body:Body, tileMovement:TileMovement}) 
	{
		trace("updateAdded");
		
		var fromPosition = node.body.b2Body.getPosition();
		var dx = UnitConvert.posXfromCellX(node.tileMovement.toCell.x) - fromPosition.x;
		//trace(UnitConvert.posXfromCellX(node.tileMovement.toCell.x) + " - " + fromPosition.x);
		var dy = UnitConvert.posYfromCellY(node.tileMovement.toCell.y) - fromPosition.y;
		trace(dx, dy);
		
		var v = new B2Vec2(dx / 500, dy / 500);
		//v.multiply(node.body.b2Body.getMass());
		trace(node.body.b2Body.getMass());
		/*
		if(!node.body.b2Body.isAwake())	node.body.b2Body.setAwake(true);
		node.body.b2Body.setLinearVelocity(v);
		*/
		node.body.b2Body.applyForce(v, node.body.b2Body.getWorldCenter());
		
		trace(node.body.b2Body.getLinearVelocity().x);
		//trace("added" + node.body.b2Body.getLinearVelocity().toString());
		//trace(node.body.b2Body.max
	}
	
	public function updateRemoved(entity:Entity, node:{tileDef:TileCoreComponent, body:Body, tileMovement:TileMovement})
	{
		trace("updateRemoved");
		node.body.b2Body.setLinearVelocity(new B2Vec2());
		node.body.b2Body.setPosition(new B2Vec2(node.tileMovement.toX(), node.tileMovement.toY()));
		node.body.b2Body.setAwake(false);
		//trace(node.tileMovement);
		if (node.tileMovement.isOut)
		{
			//trace("isOut");
			entity.removeTypes([TileCoreComponent, Body, Entity]);
			entity.destroy();
		}
		
	}
	
	
	
}