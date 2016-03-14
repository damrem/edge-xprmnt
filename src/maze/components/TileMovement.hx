package maze.components;

import de.polygonal.ds.Array2.Array2Cell;
import edge.IComponent;
import hxlpers.Direction;

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
	public var direction:Direction;
	
	public function new(toCell:Array2Cell, isOut:Bool=false, direction:Direction) 
	{
		this.toCell = toCell;
		this.isOut = isOut;
		this.direction = direction;
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