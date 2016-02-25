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
		gfx.display.x = Math.round(pos.x / RenderingConf.PIXEL_SIZE) * RenderingConf.PIXEL_SIZE;
		gfx.display.y = Math.round(pos.y / RenderingConf.PIXEL_SIZE) * RenderingConf.PIXEL_SIZE;
		gfx.display.rotation = body.b2Body.getAngle().toDegrees();
	}
	
}