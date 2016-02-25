package rendering.systems;
import b2d.components.Body;
import edge.ISystem;
import rendering.components.Gfx;
using hxlpers.math.MathSF;
/**
 * ...
 * @author damrem
 */
class GfxPositioner implements ISystem
{

	public function update(gfx:Gfx, body:Body) 
	{
		var pos = body.b2Body.getPosition();
		gfx.display.x = pos.x;
		gfx.display.y = pos.y;
		gfx.display.rotation = body.b2Body.getAngle().toDegrees();
	}
	
}