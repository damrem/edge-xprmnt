package maze.systems;
import b2d.B2;
import b2d.components.Body;
import b2d.components.MultiShapedFixtureDef;
import box2D.dynamics.B2FixtureDef;
import edge.Entity;
import edge.ISystem;
import maze.components.TileDef;

/**
 * ...
 * @author damrem
 */
class BuildPhysicalTile implements ISystem
{
	var cornerBlockSize:Float;
	var cornerBlockCoords:Array<Float>;
	var fixtureDef:B2FixtureDef;
	var cornerBlockAbsCoord:Float;
	var wallLength:Float;
	
	public function new() 
	{
		fixtureDef = B2.b2FixtureDef();
		
		cornerBlockSize = (TileConf.SIZE - TileConf.TUNNEL_SIZE) / 4;
		cornerBlockAbsCoord = (TileConf.TUNNEL_SIZE) / 2 + cornerBlockSize;
		cornerBlockCoords = [ -cornerBlockAbsCoord, cornerBlockAbsCoord];
		wallLength = TileConf.TUNNEL_SIZE / 2;
		
	}
	
	function update(tileDef:TileDef, body:Body)
	{
		
	}
	
	public function updateAdded(entity:Entity, node:{ tileDef:TileDef, body:Body })
	{
		var shapedFixtureDefs = [];
		
		for (x in cornerBlockCoords)
		{
			for (y in cornerBlockCoords)
			{
				shapedFixtureDefs.push(B2.shapedFixtureDef(B2.b2Rect(cornerBlockSize, cornerBlockSize, x, y)));
			}
		}
		
		if (!node.tileDef.bottom)
		{
			shapedFixtureDefs.push(B2.shapedFixtureDef(B2.b2Rect(wallLength, cornerBlockSize, 0, cornerBlockAbsCoord)));
		}
		
		if (!node.tileDef.top)
		{
			shapedFixtureDefs.push(B2.shapedFixtureDef(B2.b2Rect(wallLength, cornerBlockSize, 0, -cornerBlockAbsCoord)));
		}
		
		if (!node.tileDef.right)
		{
			shapedFixtureDefs.push(B2.shapedFixtureDef(B2.b2Rect(cornerBlockSize, wallLength, cornerBlockAbsCoord, 0)));
		}
		
		if (!node.tileDef.left)
		{
			shapedFixtureDefs.push(B2.shapedFixtureDef(B2.b2Rect(cornerBlockSize, wallLength, cornerBlockAbsCoord, 0)));
		}
		
		entity.add(new MultiShapedFixtureDef(shapedFixtureDefs));
		
	}
	
	public function updateRemoved(e:Entity, node:{ tileDef:TileDef, body:Body })
	{
		
	}
	
}