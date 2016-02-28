package maze.systems;
import b2d.B2;
import b2d.components.Body;
import b2d.components.FixtureDef;
import b2d.components.MultiFixtureDef;
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
	var cornerBlockSize:Float;
	var cornerBlockCoords:Array<Float>;
	var cornerBlockAbsCoord:Float;
	var wallLength:Float;
	
	public function new() 
	{
		cornerBlockSize = (TileConf.SIZE - TileConf.TUNNEL_SIZE) / 4;
		cornerBlockAbsCoord = (TileConf.TUNNEL_SIZE) / 2 + cornerBlockSize;
		trace(cornerBlockAbsCoord);
		cornerBlockCoords = [ -cornerBlockAbsCoord, cornerBlockAbsCoord];
		wallLength = TileConf.TUNNEL_SIZE / 2;
		
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
				shapedFixtureDefs.push(new FixtureDef( {
					shape: B2.b2Rect(cornerBlockSize, cornerBlockSize, x, y),
					filter: {
						categoryBits:Main.TILE_CATEGORY, 
						maskBits: Main.TILE_MASK
					}
				}));
			}
		}
		
		if (!node.aperture.bottom)
		{
			shapedFixtureDefs.push(new FixtureDef( { 
				shape: B2.b2Rect(wallLength, cornerBlockSize, 0, cornerBlockAbsCoord), 
				filter: {
					categoryBits:Main.TILE_CATEGORY, 
					maskBits: Main.TILE_MASK
				}
			} ));
		}
		
		if (!node.aperture.top)
		{
			shapedFixtureDefs.push(new FixtureDef( { 
				shape: B2.b2Rect(wallLength, cornerBlockSize, 0, -cornerBlockAbsCoord), 
				filter: {
					categoryBits:Main.TILE_CATEGORY, 
					maskBits: Main.TILE_MASK
				}
			} ));
		}
		
		if (!node.aperture.right)
		{
			shapedFixtureDefs.push(new FixtureDef( { 
				shape: B2.b2Rect(cornerBlockSize, wallLength, cornerBlockAbsCoord, 0), 
				filter: {
					categoryBits:Main.TILE_CATEGORY, 
					maskBits: Main.TILE_MASK
				}
			} ));
		}
		
		if (!node.aperture.left)
		{
			shapedFixtureDefs.push(new FixtureDef( { 
				shape: B2.b2Rect(cornerBlockSize, wallLength, -cornerBlockAbsCoord, 0), 
				filter: {
					categoryBits:Main.TILE_CATEGORY, 
					maskBits: Main.TILE_MASK
				}
			} ));
		}
		
		entity.add(new MultiFixtureDef(shapedFixtureDefs));
		
	}
	
	public function updateRemoved(e:Entity, node:{ aperture:Aperture, body:Body })
	{
		
	}
	
}