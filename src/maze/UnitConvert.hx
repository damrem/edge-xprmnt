package maze;

/**
 * ...
 * @author damrem
 */
class UnitConvert
{

	public static function posXfromCellX(cellX:Int):Float
	{
		return (0.5+cellX + 0.5) * TileConf.SIZE;
	}
	
	public static function posYfromCellY(cellY:Int):Float
	{
		return (0.5+cellY + 0.5) * TileConf.SIZE;
	}
}