package maze.components;
import de.polygonal.ds.Array2;
import edge.Entity;
import edge.IComponent;
import maze.components.TileCoreComponent;

using hxlpers.ds.Array2SF;

/**
 * ...
 * @author damrem
 */
class Maze implements IComponent
{

	public var tiles:Array2 < Entity > ;
	
	/*
	public function new(tileEntities:Array2<Array<{}>>)
	{
		for (tileEntity in tileEntities)
		{
			var cell = tileEntities.getCellOf(tileEntity);
			tiles.set(cell.x, cell.y, tileEntity.
		}
	}
	*/
	
}