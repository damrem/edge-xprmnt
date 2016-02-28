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
	public var toCell:Array2Cell;
	public var isEnded:Bool;
	public var dx:Float;
	public var dy:Float;
//	public var position:B2Vec2;
	
	public function new(toCell:Array2Cell) 
	{
		this.toCell = toCell;		
	}
	
	public function toString():String
	{
		return "TileMovement("+toCell.x+","+toCell.y+")";
	}
	
	public function toX():Float
	{
		return UnitConvert.posXfromCellX(toCell.x);
	}
	
	public function toY():Float
	{
		return UnitConvert.posYfromCellY(toCell.y);
	}
	
}