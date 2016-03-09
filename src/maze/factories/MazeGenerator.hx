package maze.factories;

import de.polygonal.ds.Array2;
import edge.Engine;
import edge.Entity;
import maze.factories.TileFactory;


/**
 * ...
 * @author damrem
 */
class MazeGenerator
{
	public static function createComps(engine:Engine, width:Int, height:Int):Array2<Array<{}>>
	{
		var tileComps = new Array2<Array<{}>>(width, height);
		
		for (y in 0...height)
		{
			for(x in 0...width)
			{
				var tile = TileFactory.createComps(engine, x, y);
				tileComps.set(x, y, tile);
			}
		}
		
		return tileComps;
	}
	
	public static function createEnts(engine:Engine, width:Int, height:Int):Array2<Entity>
	{
		var tileComps = createComps(engine, width, height);
		var tileEnts = new Array2<Entity>(width, height);
		for (y in 0...height)
		{
			for (x in 0...width)
			{
				tileEnts.set(x, y, TileFactory.createEntity(engine, x, y));
			}
		}
		return tileEnts;
	}
	
}