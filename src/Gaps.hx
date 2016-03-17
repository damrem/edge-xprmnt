package;
import b2d.B2;
import b2d.components.Body;
import b2d.components.Fixture;
import box2D.collision.shapes.B2PolygonShape;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2BodyType;
import edge.Engine;
import heroes.PlayerConf;
import maze.MazeConf;
import maze.TileConf;

/**
 * ...
 * @author damrem
 */
class Gaps
{

	public static function create(engine:Engine) 
	{
		/**
		 * BORDERS
		 */
		var borderHalfWidth = (MazeConf.WIDTH * TileConf.SIZE / 2 + PlayerConf.SIZE) / B2.worldScale;
		var borderHalfHeight = (MazeConf.HEIGHT * TileConf.SIZE / 2 + PlayerConf.SIZE) / B2.worldScale;
		
		var filter:B2FilterDataDef = {
			categoryBits: Main.BORDER_CATEGORY,
			maskBits: Main.BORDER_MASK
		};
		
		var vEdgeFixtureDef:FixtureDefDef = {
			shape: B2PolygonShape.asEdge(new B2Vec2(0,  -borderHalfHeight), new B2Vec2(0, borderHalfHeight)),
			filter: filter,
			isSensor: true
		};
		
		var hEdgeFixtureDef:FixtureDefDef = {
			shape: B2PolygonShape.asEdge(new B2Vec2( -borderHalfWidth, 0), new B2Vec2(borderHalfWidth, 0)),
			filter: filter,
			isSensor: true
		};
		
		
		
		//LEFT
		engine.create([
			new Body( {
				x: (MazeConf.xOffset - PlayerConf.SIZE) / B2.worldScale,
				y: (MazeConf.yOffset + MazeConf.HEIGHT * TileConf.SIZE / 2) / B2.worldScale,
				type:B2BodyType.STATIC_BODY
			}),
			new Fixture(vEdgeFixtureDef)
		]);
		
		//UP
		engine.create([
			new Body( {
				x: (MazeConf.xOffset + MazeConf.WIDTH * TileConf.SIZE / 2) / B2.worldScale,
				y: (MazeConf.yOffset - PlayerConf.SIZE) / B2.worldScale,
				type:B2BodyType.STATIC_BODY
			}),
			new Fixture( hEdgeFixtureDef)
		]);
		
		//RIGHT
		engine.create([
			new Body( {
				x: (MazeConf.xOffset + MazeConf.WIDTH * TileConf.SIZE + PlayerConf.SIZE) / B2.worldScale,
				y: (MazeConf.yOffset + MazeConf.HEIGHT * TileConf.SIZE / 2) / B2.worldScale,
				type:B2BodyType.STATIC_BODY
			}),
			new Fixture(vEdgeFixtureDef)
		]);
		
		//DOWN
		engine.create([
			new Body( {
				x: (MazeConf.xOffset + MazeConf.WIDTH * TileConf.SIZE / 2) / B2.worldScale,
				y: (MazeConf.yOffset + MazeConf.HEIGHT*TileConf.SIZE + PlayerConf.SIZE) / B2.worldScale,
				type:B2BodyType.STATIC_BODY
			}),
			new Fixture(hEdgeFixtureDef)
		]);
	}
	
}