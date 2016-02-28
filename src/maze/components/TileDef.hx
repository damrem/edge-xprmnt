package maze.components;
import de.polygonal.ds.Array2.Array2Cell;
import edge.IComponent;

/**
 * ...
 * @author damrem
 */
class TileDef implements IComponent
{

	var bits:Int;
	var cell:Array2Cell;
	
	public function new(x:Int, y:Int)
	{
		do
		{
			bits = Std.random(16);
		}
		while (bits == 0 || bits == 1 || bits == 2 || bits == 4 || bits == 8);
		cell = new Array2Cell(x, y);
	}
	
	public var right(get, null):Bool;
	function get_right()
	{
		return bits & 1 > 0;
	}
	
	public var bottom(get, null):Bool;
	function get_bottom()
	{
		return bits & 2 > 0;
	}
	
	public var left(get, null):Bool;
	function get_left()
	{
		return bits & 4 > 0;
	}
	
	public var top(get, null):Bool;
	function get_top()
	{
		return bits & 8 > 0;
	}
	
	public function toString():String
	{
		return "TileDef("+ bits + ")";
	}
	
}