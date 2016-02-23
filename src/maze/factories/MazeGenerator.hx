package maze.factories;

import de.polygonal.ds.Array2;
import edge.Entity;
import maze.factories.TileFactory;


/**
 * ...
 * @author damrem
 */
class MazeGenerator
{
	public static function create(width:Int, height:Int):Array2<Array<{}>>
	{
		var tiles = new Array2<Array<{}>>(width, height);
		
		for (y in 0...height)
		{
			for(x in 0...width)
			{
				var tile = TileFactory.createEntity(x, y);
				trace(x, y);
				tiles.set(x, y, tile);
			}
		}
		
		return tiles;
	}
	
}