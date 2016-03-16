package playertile;
import b2d.components.Body;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import edge.Entity;
import edge.ISystem;
import heroes.PlayerCoreComponent;
import maze.components.TileMovement;
import openfl.display.FPS;
import rendering.components.Opacity;

using hxlpers.edge.EntityStaticExtension;
/**
 * ...
 * @author damrem
 */
class MovePlayerWithTile implements ISystem
{
	var timeDelta:Float;
	var entity:Entity;
	
	var tileForce:B2Vec2;
	var tileEntity:Entity;
	var tileMovement:TileMovement;
	var tileBody:Body;
	
	public function update(player:PlayerCoreComponent, playerBody:Body, tileEntityRef:TileEntityRef)
	{
		//trace(playerBody.b2Body.getLinearVelocity().length()*1000);
		tileEntity = tileEntityRef.tile;
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
		
		tileForce.add(playerBody.b2Body.getPosition());
		
		playerBody.b2Body.setPosition(tileForce);
		
	}
	
}