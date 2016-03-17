package items;
import b2d.components.Body;
import b2d.components.Fixture;
import box2D.collision.shapes.B2CircleShape;
import box2D.dynamics.B2BodyType;
import de.polygonal.ds.Array2.Array2Cell;
import hxlpers.Direction;
import hxlpers.shapes.DiskShape;
import maze.TileConf;
import maze.UnitConvert;
import rendering.components.Gfx;

/**
 * ...
 * @author damrem
 */
class ArrowItemFactory
{

	public static function createComps(cell:Array2Cell):Array<{}>
	{
		var comps:Array<{}> = [
		
			new ArrowItem(Random.enumConstructor(Direction)),
			new Body( {
				x: UnitConvert.posXfromCellX(cell.x),
				y: UnitConvert.posYfromCellY(cell.y),
				type: B2BodyType.DYNAMIC_BODY
			}),
			new Fixture( {
				isSensor: true,
				shape: new B2CircleShape(TileConf.TUNNEL_SIZE/2)
			}),
			new Gfx(new DiskShape(TileConf.TUNNEL_SIZE / 2, 0xffffff)),
			Main.mainLayer
		
		];
		
		return comps;
	}
	
}