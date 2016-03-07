package maze.factories;

import b2d.components.Body;
import box2D.dynamics.B2BodyType;
import edge.Engine;
import edge.Entity;
import flash.display.Bitmap;
import hxlpers.shapes.BoxShape;
import maze.components.TileCoreComponent;
import openfl.Assets;
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
		//trace("createEntity(" + x, y);
		var comps = new Array<{}>();
		
		comps.push(new TileCoreComponent());
		
		comps.push(new Body({
			x: UnitConvert.posXfromCellX(x), 
			y: UnitConvert.posYfromCellY(y),
			type: B2BodyType.KINEMATIC_BODY
		}));
		
		var ground = new Bitmap(Assets.getBitmapData("img/ground1.gif"));
		var gfx = new Sprite();
		gfx.addChild(ground);
		comps.push(new Gfx(gfx));
		comps.push(Main.mainLayer);
		
		return comps;
	}
	
	public static function createEntity(engine:Engine, x:Int, y:Int)
	{
		return engine.create(createComps(x, y));
		
	}
	
}