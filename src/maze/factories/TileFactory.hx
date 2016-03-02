package maze.factories;

import b2d.components.Body;
import box2D.dynamics.B2BodyType;
import hxlpers.shapes.BoxShape;
import maze.components.TileDef;
import openfl.display.Sprite;
import rendering.components.Gfx;


/**
 * ...
 * @author damrem
 */
class TileFactory
{
	public static function createComps(x:Int, y:Int):Array<{}>
	{
		trace("createEntity(" + x, y);
		var comps = new Array<{}>();
		
		comps.push(new TileDef());
		
		comps.push(new Body({
			x: UnitConvert.posXfromCellX(x), 
			y: UnitConvert.posYfromCellY(y),
			type: B2BodyType.KINEMATIC_BODY
		}));
		
		comps.push(new Gfx(new Sprite()));
		comps.push(Main.mainLayer);
		
		return comps;
	}
	
}