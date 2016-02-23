package maze.systems;
import b2d.B2;
import b2d.components.Body;
import b2d.components.MultiShapedFixtureDef;
import box2D.dynamics.B2FixtureDef;
import edge.Entity;
import edge.ISystem;
import maze.components.Aperture;

/**
 * ...
 * @author damrem
 */
class BuildPhysicalTile implements ISystem
{
	static public inline var TILE_SIZE:Float = 48;
	static public inline var TUNNEL_SIZE:Float = 32;

	var cornerBlockSize:Float;
	var cornerBlockCoords:Array<Float>;
	var fixtureDef:B2FixtureDef;
	var cornerBlockAbsCoord:Float;
	var wallLength:Float;
	
	public function new() 
	{
		fixtureDef = B2.b2FixtureDef();
		
		cornerBlockSize = (TILE_SIZE - TUNNEL_SIZE) / 4;
		cornerBlockAbsCoord = (TUNNEL_SIZE) / 2 + cornerBlockSize;
		trace(cornerBlockAbsCoord);
		cornerBlockCoords = [ -cornerBlockAbsCoord, cornerBlockAbsCoord];
		wallLength = TUNNEL_SIZE / 2;
		
	}
	
	function update(aperture:Aperture, body:Body)
	{
		
	}
	
	public function updateAdded(entity:Entity, node:{ aperture:Aperture, body:Body })
	{
		var shapedFixtureDefs = [];
		
		for (x in cornerBlockCoords)
		{
			for (y in cornerBlockCoords)
			{
				shapedFixtureDefs.push(B2.shapedFixtureDef(B2.b2Rect(cornerBlockSize, cornerBlockSize, x, y)));
			}
		}
		
		if (!node.aperture.bottom)
		{
			shapedFixtureDefs.push(B2.shapedFixtureDef(B2.b2Rect(wallLength, cornerBlockSize, 0, cornerBlockAbsCoord)));
		}
		
		if (!node.aperture.top)
		{
			shapedFixtureDefs.push(B2.shapedFixtureDef(B2.b2Rect(wallLength, cornerBlockSize, 0, -cornerBlockAbsCoord)));
		}
		
		if (!node.aperture.right)
		{
			shapedFixtureDefs.push(B2.shapedFixtureDef(B2.b2Rect(cornerBlockSize, wallLength, cornerBlockAbsCoord, 0)));
		}
		
		if (!node.aperture.left)
		{
			shapedFixtureDefs.push(B2.shapedFixtureDef(B2.b2Rect(cornerBlockSize, wallLength, cornerBlockAbsCoord, 0)));
		}
		
		entity.add(new MultiShapedFixtureDef(shapedFixtureDefs));
		
	}
	
	public function updateRemoved(e:Entity, node:{ aperture:Aperture, body:Body })
	{
		
	}
	
}