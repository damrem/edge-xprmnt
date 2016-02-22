package maze.systems;
import b2d.B2;
import b2d.components.Body;
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
	
	public function updateAdded(e:Entity, node:{ aperture:Aperture, body:Body })
	{
		node.body.b2Body = B2.world.createBody(node.body.b2BodyDef);
		
		for (x in cornerBlockCoords)
		{
			for (y in cornerBlockCoords)
			{
				fixtureDef.shape = B2.b2Rect(cornerBlockSize, cornerBlockSize, x, y);
				node.body.b2Body.createFixture(fixtureDef);
			}
		}
		
		if (!node.aperture.bottom)
		{
			fixtureDef.shape = B2.b2Rect(wallLength, cornerBlockSize, 0, cornerBlockAbsCoord);
			node.body.b2Body.createFixture(fixtureDef);
		}
		if (!node.aperture.top)
		{
			fixtureDef.shape = B2.b2Rect(wallLength, cornerBlockSize, 0, -cornerBlockAbsCoord);
			node.body.b2Body.createFixture(fixtureDef);
		}
		if (!node.aperture.right)
		{
			fixtureDef.shape = B2.b2Rect(cornerBlockSize, wallLength, cornerBlockAbsCoord, 0);
			node.body.b2Body.createFixture(fixtureDef);
		}
		if (!node.aperture.left)
		{
			fixtureDef.shape = B2.b2Rect(cornerBlockSize, wallLength, cornerBlockAbsCoord, 0);
			node.body.b2Body.createFixture(fixtureDef);
		}
		
	}
	
	public function updateRemoved(e:Entity, node:{ aperture:Aperture, body:Body })
	{
		
	}
	
}