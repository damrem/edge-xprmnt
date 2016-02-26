package maze.components;
import de.polygonal.ds.Array2;
import edge.IComponent;
import maze.components.TileDef;

using hxlpers.ds.Array2SF;

/**
 * ...
 * @author damrem
 */
class Maze implements IComponent
{

	public var tileDefs:Array2 < TileDef > > ;
	
	public function new(tileEntities:Array2<Array<{}>>)
	{
		for (tileEntity in tileEntities)
		{
			var cell = tileEntities.getCellOf(tileEntity);
			tileDefs.set(cell.x, cell.y, tileEntity.
		}
	}
	
}