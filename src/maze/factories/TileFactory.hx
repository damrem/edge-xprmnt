package maze.factories;

import b2d.components.Body;
import box2D.dynamics.B2BodyType;
import maze.components.TileDef;
import maze.components.TileMovement;


/**
 * ...
 * @author damrem
 */
class TileFactory
{
	public static function createEntity(x:Int, y:Int/*, ?tileMovement:TileMovement*/):Array<{}>
	{
		trace("createEntity(" + x, y);
		var tileEntity = new Array<{}>();
		
		tileEntity.push(new TileDef());
		//tileEntity.push(new Position((x + 0.5) * TileConf.SIZE, ));
		
		tileEntity.push(new Body({
			x: UnitConvert.posXfromCellX(x), 
			y: UnitConvert.posYfromCellY(y),
			type: B2BodyType.KINEMATIC_BODY
		}));
		
		/*
		if (tileMovement != null)
		{
			tileEntity.push(tileMovement);
		}
		*/
		
		return tileEntity;
	}
	
}