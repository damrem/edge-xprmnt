package maze.components;

import de.polygonal.ds.Array2.Array2Cell;
import edge.IComponent;

/**
 * ...
 * @author damrem
 */
class TileMovement implements IComponent
{
	public var toCell:Array2Cell;
	public var dx:Float;
	public var dy:Float;
	public var isOut:Bool;
	
	public function new(toCell:Array2Cell, isOut:Bool=false) 
	{
		this.toCell = toCell;
		this.isOut = isOut;
	}
	
	public function toString():String
	{
		return "TileMovement("+toCell.x+","+toCell.y+","+isOut+")";
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