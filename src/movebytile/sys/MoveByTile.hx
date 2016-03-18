package movebytile.sys;
import b2d.components.Body;
import box2D.common.math.B2Vec2;
import edge.Entity;
import edge.ISystem;
import maze.components.TileMovement;
import movebytile.comps.IsOnTile;
import rendering.components.Opacity;

using hxlpers.edge.EntityStaticExtension;
/**
 * ...
 * @author damrem
 */
class MoveByTile implements ISystem
{
	var timeDelta:Float;
	var entity:Entity;
	
	var tileForce:B2Vec2;
	var tileEntity:Entity;
	var tileMovement:TileMovement;
	var tileBody:Body;
	
	public function update(body:Body, isOnTile:IsOnTile)
	{
		//trace(playerBody.b2Body.getLinearVelocity().length()*1000);
		tileEntity = isOnTile.tile;
		tileMovement = tileEntity.getFirstComponentOfType(TileMovement);
		
		if (tileMovement == null)
		{
			return;
		}

		#if debug
		//trace('plop');
		if(tileEntity.existsType(Opacity))	tileEntity.removeType(Opacity);
		tileEntity.add(new Opacity(Math.random()));
		#end
		
		tileBody = tileEntity.getFirstComponentOfType(Body);
		
		tileForce = tileBody.b2Body.getLinearVelocity().copy();
		tileForce.multiply(timeDelta/1000);
		
		tileForce.add(body.b2Body.getPosition());
		
		body.b2Body.setPosition(tileForce);
		
	}
	
}