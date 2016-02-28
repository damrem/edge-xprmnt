package maze.factories;

import b2d.components.Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2BodyType;
import maze.components.TileDef;


/**
 * ...
 * @author damrem
 */
class TileFactory
{
	public static function createEntity(x:Int, y:Int):Array<{}>
	{
		var tileEntity = new Array<{}>();
		
		tileEntity.push(new TileDef(x, y));
		//tileEntity.push(new Position((x + 0.5) * TileConf.SIZE, ));
		
		tileEntity.push(new Body({
			x: (x + 0.5) * TileConf.SIZE, 
			y: (y + 0.5) * TileConf.SIZE,
			type: B2BodyType.KINEMATIC_BODY
		}));
		
		return tileEntity;
	}
	
}