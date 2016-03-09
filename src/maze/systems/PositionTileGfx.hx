package maze.systems;
import b2d.components.Body;
import edge.Entity;
import edge.ISystem;
import maze.components.TileBack;
import maze.components.TileFront;
import rendering.components.Gfx;
import rendering.RenderingConf;
using hxlpers.edge.EntityStaticExtension;
/**
 * ...
 * @author damrem
 */
class PositionTileGfx implements ISystem
{

	public function update(tileBody:Body, tileBack:TileBack, tileFront:TileFront) 
	{
		var pos = tileBody.b2Body.getPosition();
		
		var backEntity:Entity = tileBack.entity;
		var backGfx = backEntity.getFirstComponentOfType(Gfx);
		
		var frontEntity:Entity = tileFront.entity;
		var frontGfx = frontEntity.getFirstComponentOfType(Gfx);
		
		backGfx.display.x = frontGfx.display.x = Math.round(pos.x / RenderingConf.PIXEL_SIZE) * RenderingConf.PIXEL_SIZE;
		backGfx.display.y = frontGfx.display.y = Math.round(pos.y / RenderingConf.PIXEL_SIZE) * RenderingConf.PIXEL_SIZE;
		
	}
	
}