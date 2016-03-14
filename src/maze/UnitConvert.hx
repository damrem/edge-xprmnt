package maze;
import b2d.B2;

/**
 * ...
 * @author damrem
 */
class UnitConvert
{

	public static function posXfromCellX(cellX:Int):Float
	{
		return (cellX + 0.5) * TileConf.SIZE / B2.worldScale;
	}
	
	public static function posYfromCellY(cellY:Int):Float
	{
		return (cellY + 0.5) * TileConf.SIZE / B2.worldScale;
	}
	
	public static function cellXfromPosX(posX:Float):Int
	{
		return Math.round(posX * B2.worldScale / TileConf.SIZE - 0.5);
	}
	
	public static function cellYfromPosY(posY:Float):Int
	{
		return Math.round(posY * B2.worldScale / TileConf.SIZE - 0.5);
	}
}