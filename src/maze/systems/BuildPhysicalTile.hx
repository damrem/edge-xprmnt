package maze.systems;
import b2d.B2;
import b2d.B2RectShape;
import b2d.components.Body;
import b2d.components.FixtureDef;
import b2d.components.MultiFixtureDef;
import box2D.dynamics.B2FixtureDef;
import edge.Entity;
import edge.ISystem;
import heroes.PlayerConf;
import maze.components.TileCoreComponent;

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
		cornerBlockSize = (TileConf.SIZE - TileConf.TUNNEL_SIZE) / 2;
		cornerBlockAbsCoord = (TileConf.TUNNEL_SIZE + cornerBlockSize) / 2;
		cornerBlockCoords = [ -cornerBlockAbsCoord, cornerBlockAbsCoord];
		wallLength = TileConf.TUNNEL_SIZE;
		
	}
	
	function update(tileDef:TileCoreComponent, body:Body)
	{
		
	}
	
	public function updateAdded(entity:Entity, node:{ tileDef:TileCoreComponent, body:Body })
	{
		var fixtureDefs = [];
		
		for (x in cornerBlockCoords)
		{
			for (y in cornerBlockCoords)
			{
				fixtureDefs.push(new FixtureDef( {
					//density:10,
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
			fixtureDefs.push(new FixtureDef( { 
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
			fixtureDefs.push(new FixtureDef( { 
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
			fixtureDefs.push(new FixtureDef( { 
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
			fixtureDefs.push(new FixtureDef( { 
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
		
		fixtureDefs.push(new FixtureDef( {
			shape: new B2RectShape( {
				width: TileConf.SIZE-PlayerConf.SIZE-1,
				height: TileConf.SIZE-PlayerConf.SIZE-1
			}),
			isSensor:true,
			filter: {
				categoryBits:Main.TILE_CATEGORY, 
				maskBits: Main.TILE_MASK
			}
		}));
		
		entity.add(new MultiFixtureDef(fixtureDefs));
		
	}
	
	public function updateRemoved(e:Entity, node:{ tileDef:TileCoreComponent, body:Body })
	{
		
	}
	
}