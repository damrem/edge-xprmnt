package maze.systems;
import edge.Entity;
import edge.ISystem;
import hxlpers.shapes.BoxShape;
import maze.components.TileDef;
import openfl.display.Shape;
import openfl.display.Sprite;
import rendering.components.Gfx;

using hxlpers.display.SpriteSF;

/**
 * ...
 * @author damrem
 */
class DrawTile implements ISystem
{
	var cornerBlockSize:Float;
	var cornerBlockCoords:Array<Float>;
	var cornerBlockAbsCoord:Float;
	var wallLength:Float;
	
	public function new() 
	{
		cornerBlockSize = (TileConf.SIZE - TileConf.TUNNEL_SIZE) / 2;
		cornerBlockAbsCoord = (TileConf.TUNNEL_SIZE + cornerBlockSize) / 2;
		cornerBlockCoords = [ -cornerBlockAbsCoord-cornerBlockSize/2, cornerBlockAbsCoord-cornerBlockSize/2];
		wallLength = TileConf.TUNNEL_SIZE;
		
	}
	
	function update(tileDef:TileDef, gfx:Gfx)
	{
		
	}
	
	public function updateAdded(entity:Entity, node:{ tileDef:TileDef, gfx:Gfx})
	{
		var sprite = cast(node.gfx.display, Sprite);
		sprite.graphics.beginFill(0x0000ff);
		
		for (x in cornerBlockCoords)
		{
			for (y in cornerBlockCoords)
			{		
				sprite.graphics.drawRect(x, y, cornerBlockSize, cornerBlockSize);
			}
		}
		
		if (!node.tileDef.bottom)
		{
			sprite.graphics.drawRect(-wallLength/2, cornerBlockAbsCoord-cornerBlockSize/2, wallLength, cornerBlockSize);
		}
		if (!node.tileDef.top)
		{
			sprite.graphics.drawRect(-wallLength/2, -cornerBlockAbsCoord-cornerBlockSize/2, wallLength, cornerBlockSize);
		}
		
		if (!node.tileDef.right)
		{
			sprite.graphics.drawRect(cornerBlockAbsCoord-cornerBlockSize/2, -wallLength/2, cornerBlockSize, wallLength);
		}
		
		if (!node.tileDef.left)
		{
			sprite.graphics.drawRect(-cornerBlockAbsCoord-cornerBlockSize/2, -wallLength/2, cornerBlockSize, wallLength);
		}
		
		var border = new Shape();
		border.graphics.lineStyle(1, 0, 0.1);
		border.graphics.drawRect(-TileConf.SIZE/2, -TileConf.SIZE/2, TileConf.SIZE, TileConf.SIZE);
		sprite.addChild(border);
		
	}
	
	public function updateRemoved(e:Entity, node:{ tileDef:TileDef, gfx:Gfx})
	{
		cast(node.gfx.display, Sprite).graphics.clear();
	}

	
}