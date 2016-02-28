package maze.systems;
import b2d.B2;
import b2d.B2RectShape;
import b2d.components.Body;
import b2d.components.FixtureDef;
import b2d.components.MultiFixtureDef;
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
	var cornerBlockAbsCoord:Float;
	var wallLength:Float;
	
	public function new() 
	{
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
				shapedFixtureDefs.push(new FixtureDef( {
					shape: new B2RectShape( { 
						width:cornerBlockSize,
						height:cornerBlockSize,
						x:x,
						y:y,
						//angle: 0
					} ),
					//B2.b2Rect(cornerBlockSize, cornerBlockSize, x, y),
					filter: {
						categoryBits:Main.TILE_CATEGORY, 
						maskBits: Main.TILE_MASK
					}
				}));
			}
		}
		
		if (!node.tileDef.bottom)
		{
			shapedFixtureDefs.push(new FixtureDef( { 
				shape: new B2RectShape( {
					width: wallLength,
					height: cornerBlockSize, 
					x:0, 
					y:cornerBlockAbsCoord
					
				}), 
				filter: {
					categoryBits:Main.TILE_CATEGORY, 
					maskBits: Main.TILE_MASK
				}
			} ));
		}
		
		if (!node.tileDef.top)
		{
			shapedFixtureDefs.push(new FixtureDef( { 
				shape: new B2RectShape({
					width: wallLength, 
					height: cornerBlockSize, 
					x: 0, 
					y: -cornerBlockAbsCoord
				}), 
				filter: {
					categoryBits:Main.TILE_CATEGORY, 
					maskBits: Main.TILE_MASK
				}
			} ));
		}
		
		if (!node.tileDef.right)
		{
			shapedFixtureDefs.push(new FixtureDef( { 
				shape: new B2RectShape({
					width: cornerBlockSize, 
					height: wallLength, 
					x: cornerBlockAbsCoord, 
					y: 0
				}), 
				filter: {
					categoryBits:Main.TILE_CATEGORY, 
					maskBits: Main.TILE_MASK
				}
			} ));
		}
		
		if (!node.tileDef.left)
		{
			shapedFixtureDefs.push(new FixtureDef( { 
				shape: new B2RectShape( {
					width: cornerBlockSize, 
					height: wallLength, 
					x: -cornerBlockAbsCoord, 
					y:0 
				}),
				filter: {
					categoryBits:Main.TILE_CATEGORY, 
					maskBits: Main.TILE_MASK
				}
			} ));
		}
		
		entity.add(new MultiFixtureDef(shapedFixtureDefs));
		
	}
	
	public function updateRemoved(e:Entity, node:{ tileDef:TileDef, body:Body })
	{
		
	}
	
}