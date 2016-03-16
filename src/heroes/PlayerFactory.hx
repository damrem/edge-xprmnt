package heroes;
import b2d.B2;
import b2d.components.Body;
import b2d.components.FixtureDef;
import box2D.collision.shapes.B2CircleShape;
import box2D.dynamics.B2BodyType;
import controls.KeyboardCommandSet;
import de.polygonal.ds.Array2.Array2Cell;
import hxlpers.shapes.DiskShape;
import maze.UnitConvert;
import rendering.components.Gfx;
import rendering.components.Layer;

/**
 * ...
 * @author damrem
 */
class PlayerFactory
{

	public static function createComponents(cell:Array2Cell, keyboardCommandSet:KeyboardCommandSet, mainLayer:Layer):Array<{}> 
	{
		return [
			new FixtureDef( {
				shape:new B2CircleShape(PlayerConf.SIZE/2/B2.worldScale),
				density:1.0,
				filter: {
					categoryBits:Main.PLAYER_CATEGORY,
					maskBits:Main.PLAYER_MASK
				}
			}),
			new Body( {
				//x: UnitConvert.posXfromCellX(MazeConf.WIDTH - 1),
				//y: UnitConvert.posYfromCellY(MazeConf.HEIGHT - 1),
				x: UnitConvert.posXfromCellX(cell.x),
				y: UnitConvert.posYfromCellY(cell.y),
				type:B2BodyType.DYNAMIC_BODY,
				linearDamping:5,
				fixedRotation:true
			}),
			new Gfx(new DiskShape(PlayerConf.SIZE/2)),
			mainLayer,
			Main.maze,
			//new Impulse(0.02, 0.01),
			
			keyboardCommandSet,
			
			
			new PlayerCoreComponent(1000)
		];
	}
	
}