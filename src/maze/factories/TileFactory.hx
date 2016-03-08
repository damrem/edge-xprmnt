package maze.factories;

import b2d.components.Body;
import box2D.dynamics.B2BodyType;
import de.polygonal.core.math.Mathematics;
import edge.Engine;
import edge.Entity;
import flash.display.Bitmap;
import flash.geom.Point;
import flash.geom.Rectangle;
import hxlpers.shapes.BoxShape;
import maze.components.TileCoreComponent;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.Tilesheet;
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
		
		var core = new TileCoreComponent();
		comps.push(core);
		
		var wallMapping = [3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15];
		
		var tilesheet = new Tilesheet(Assets.getBitmapData("img/walls.gif"));
		for (x in 0...wallMapping.length)
		{
			var _x = x * 64;
			tilesheet.addTileRect(new Rectangle(_x, 0, 64, 80), new Point(32, 40));
		}
		
		comps.push(new Body({
			x: UnitConvert.posXfromCellX(x), 
			y: UnitConvert.posYfromCellY(y),
			type: B2BodyType.KINEMATIC_BODY
		}));
		
		var ground = new Bitmap(Assets.getBitmapData("img/ground1.gif"));
		var gfx = new Sprite();
		tilesheet.drawTiles(gfx.graphics, [0, 0, wallMapping.indexOf(core.bits)]);
		//gfx.addChild(ground);
		comps.push(new Gfx(gfx));
		comps.push(Main.tileLayers[y+1]);
		
		return comps;
	}
	
	public static function createEntity(engine:Engine, x:Int, y:Int)
	{
		return engine.create(createComps(x, y));
		
	}
	
}