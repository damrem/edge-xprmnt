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
import maze.components.TileBack;
import maze.components.TileCell;
import maze.components.TileCoreComponent;
import maze.components.TileFront;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.display.Tilesheet;
import rendering.components.Gfx;
import rendering.components.Opacity;


/**
 * ...
 * @author damrem
 */
class TileFactory
{
	static private var wallMapping = [3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15];
	public static function createComps(engine:Engine, x:Int, y:Int):Array<{}>
	{
		//trace("createEntity(" + x, y);
		var comps = new Array<{}>();
		
		var core = new TileCoreComponent();
		comps.push(core);
		
		comps.push(new TileCell(x, y));
		
		var tilesheet = new Tilesheet(Assets.getBitmapData("img/walls.gif"));
		for (x in 0...wallMapping.length)
		{
			var _x = x * 64;
			tilesheet.addTileRect(new Rectangle(_x, 0, 64, 48), new Point(32, 48));
			tilesheet.addTileRect(new Rectangle(_x, 48, 64, 32), new Point(32, 0));
		}
		
		comps.push(new Body({
			x: UnitConvert.posXfromCellX(x), 
			y: UnitConvert.posYfromCellY(y),
			type: B2BodyType.KINEMATIC_BODY
		}));
		
		
		var backGfx = new Sprite();
		tilesheet.drawTiles(backGfx.graphics, [0, 0, wallMapping.indexOf(core.bits)*2]);
		var backEntity = engine.create([
			new Gfx(backGfx),
			Main.layers.get(y + 1, 0),
			//new Opacity(0.5)
		]);
		
		var frontGfx = new Sprite();
		tilesheet.drawTiles(frontGfx.graphics, [0, 0, wallMapping.indexOf(core.bits)*2+1]);
		var frontEntity = engine.create([
			new Gfx(frontGfx),
			Main.layers.get(y+1, 2),
			//new Opacity(0.5)
		]);
		
		comps.push(new TileBack(backEntity));
		comps.push(new TileFront(frontEntity));
		
		return comps;
	}
	
	public static function createEntity(engine:Engine, x:Int, y:Int)
	{
		return engine.create(createComps(engine, x, y));
		
	}
	
}