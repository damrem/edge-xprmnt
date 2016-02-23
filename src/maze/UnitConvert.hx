package maze;

/**
 * ...
 * @author damrem
 */
class UnitConvert
{

	public static function posXfromCellX(cellX:Int):Float
	{
		return (cellX + 0.5) * TileConf.SIZE;
	}
	
	public static function posYfromCellY(cellY:Int):Float
	{
		return (cellY + 0.5) * TileConf.SIZE;
	}
}