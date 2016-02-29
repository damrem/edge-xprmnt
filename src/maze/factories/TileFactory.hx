package maze.factories;

import b2d.components.Body;
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
		trace("createEntity(" + x, y);
		var tileEntity = new Array<{}>();
		
		tileEntity.push(new TileDef());
		
		tileEntity.push(new Body({
			x: UnitConvert.posXfromCellX(x), 
			y: UnitConvert.posYfromCellY(y),
			type: B2BodyType.KINEMATIC_BODY
		}));
		
		return tileEntity;
	}
	
}