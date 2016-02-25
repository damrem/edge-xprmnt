package rendering.systems;
import b2d.components.Body;
import edge.ISystem;
import rendering.components.Gfx;
using hxlpers.math.MathSF;
/**
 * ...
 * @author damrem
 */
class PositionGfx implements ISystem
{

	public function update(gfx:Gfx, body:Body) 
	{
		var pos = body.b2Body.getPosition();
		gfx.display.x = Std.int(pos.x);
		gfx.display.y = Std.int(pos.y);
		gfx.display.rotation = body.b2Body.getAngle().toDegrees();
	}
	
}