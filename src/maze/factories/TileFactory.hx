package maze.factories;

import b2d.B2;
import b2d.components.Body;
import b2d.components.Position;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2BodyType;
import edge.Entity;
import edge.IComponent;
import maze.components.Aperture;


/**
 * ...
 * @author damrem
 */
class TileFactory
{
	public static function createEntity(x:Int, y:Int):Array<{}>
	{
		var tileEntity = new Array<{}>();
		
		tileEntity.push(new Aperture());
		tileEntity.push(new Position((x + 0.5) * TileConf.SIZE, (y + 0.5) * TileConf.SIZE));
		
		var b2BodyDef = new B2BodyDef();
		b2BodyDef.type = B2BodyType.KINEMATIC_BODY;
		tileEntity.push(new Body(b2BodyDef));
		
		return tileEntity;
	}
	
}