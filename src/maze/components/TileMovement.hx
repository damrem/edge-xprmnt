package maze.components;

import box2D.common.math.B2Vec2;
import de.polygonal.ds.Array2.Array2Cell;
import edge.IComponent;

/**
 * ...
 * @author damrem
 */
class TileMovement implements IComponent
{
	public var destCell:Array2Cell;
	public var position:B2Vec2;
	
	public function new(destCell:Array2Cell) 
	{
		this.destCell = destCell;
		
	}
	
}