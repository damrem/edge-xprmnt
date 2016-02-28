package;

import b2d.B2;
import b2d.systems.BodyApplyImpulse;
import b2d.systems.BodyCreateFixture;
import b2d.systems.BodyDefSetPosition;
import b2d.systems.CreateBodyFromDef;
import b2d.systems.WorldDrawDebugData;
import b2d.systems.WorldStep;
import edge.World;
import maze.components.Maze;
import maze.factories.MazeGenerator;
import maze.systems.BuildPhysicalTile;
import maze.systems.MoveMaze;
import maze.systems.MoveMazeRandomly;
import maze.systems.MoveTile;
import openfl.display.FPS;
import openfl.display.Sprite;
import rendering.components.Layer;
import rendering.RenderingConf;
import rendering.systems.AddRemoveGfx;
import rendering.systems.PositionGfx;
import rendering.systems.RenderLayer;


using hxlpers.display.ShapeSF;

/**
 * ...
 * @author damrem
 */
class Main extends Sprite 
{
	public static var maze:Maze;

	public static inline var HERO_CATEGORY:Int = 0x0002;
	public static inline var TILE_CATEGORY:Int = 0x0004;
	public static inline var BOUNDARY_CATEGORY:Int = 0x0008;
	
	public static inline var HERO_MASK:Int = TILE_CATEGORY | BOUNDARY_CATEGORY;
	public static inline var TILE_MASK:Int = HERO_CATEGORY;
	public static inline var BOUNDARY_MASK:Int = HERO_CATEGORY;
	
	public function new() 
	{
		super();
		
		var edgeWorld = new World();
		B2.createWorld();
		
		/*
		var bd = new BodyDef();
		bd.position.set(100, 100);
		bd.type = B2BodyType.DYNAMIC_BODY;
		var fd = new FixtureDef();
		fd.density = 1;
		fd.shape = new B2CircleShape(50);
		var body = b2World.createBody(bd);
		body.createFixture(fd);
		*/
		
		//	SYSTEMS
		edgeWorld.physics.add(new WorldStep());
		edgeWorld.physics.add(new WorldDrawDebugData());
		
		edgeWorld.physics.add(new BodyDefSetPosition());
		edgeWorld.physics.add(new CreateBodyFromDef());
		edgeWorld.physics.add(new BodyApplyImpulse());
		
		edgeWorld.physics.add(new BuildPhysicalTile());
		edgeWorld.physics.add(new BodyCreateFixture());
		
		edgeWorld.physics.add(new MoveMazeRandomly());
		edgeWorld.physics.add(new MoveMaze());
		edgeWorld.physics.add(new MoveTile());
		
		
		
		
		//edgeWorld.physics.add(new BodyCreateFixture());
		
		
		var mainLayer = new Layer(RenderingConf.PIXEL_SIZE);
		
		edgeWorld.render.add(new RenderLayer(this));
		edgeWorld.render.add(new AddRemoveGfx());
		edgeWorld.render.add(new PositionGfx());
		
		//edgeWorld.physics.add(new CreateShape());
		edgeWorld.start();
		
		//	ENTITIES
		/*
		edgeWorld.engine.create(Factory.createBallEntity(100, 100, 50, 0, 0xff0000));
		edgeWorld.engine.create(Factory.createBallEntity(100, 100, 50, 0, 0xff0000));
		*/
		
		var disk = new openfl.display.Shape();
		disk.circle(50, 0xff0000);
		
		edgeWorld.engine.create([mainLayer]);
		
		/*
		edgeWorld.engine.create([
			new Position(50, 50), 
			B2.shapedFixtureDef(B2.b2Circle(50), 1.0),
			new Body(B2.b2BodyDef(B2BodyType.DYNAMIC_BODY))
			B2.bodyDef(B2BodyType.DYNAMIC_BODY), 
			B2.circleShape(48),
			B2.fixtureDef(1.0),
			new Body(),
			new Gfx(new DiskShape(48)),
			mainLayer,
			new Impulse(0.02,0.01)
		]);
		
		edgeWorld.engine.create([
			new Position(150, 150), 
			B2.shapedFixtureDef(B2.b2Rect(10, 10), 1.0),
			new Body(B2.b2BodyDef(B2BodyType.DYNAMIC_BODY))
			B2.bodyDef(B2BodyType.DYNAMIC_BODY), 
			B2.rectShape(48, 48),
			B2.fixtureDef(1.0),
			new Body(),
			new Gfx(new BoxShape(48, 48)),
			mainLayer,
			new Impulse(-0.01,-0.02)
		]);
		
		edgeWorld.engine.create([
			new Position(200, 200),
			new Body(B2.b2BodyDef(B2BodyType.KINEMATIC_BODY)),
			new MultiShapedFixtureDef([
				B2.shapedFixtureDef(B2.b2Rect(30, 10), 1.0),
				B2.shapedFixtureDef(B2.b2Rect(10, 30), 1.0),
				B2.shapedFixtureDef(B2.b2Rect(50, 10), 1.0)
			])
		]);
		
		edgeWorld.engine.create([
			new Body(B2.b2BodyDef()),
			new Position(300, 150),
			new Aperture()
		]);
		*/
		
		var tiles = MazeGenerator.create(9, 9);
		
		maze = new Maze(tiles);
		
		edgeWorld.engine.create([maze]);
		
		for (tile in tiles)
		{
			edgeWorld.engine.create(tile);
		}
		
		//addEventListener(MouseEvent.CLICK, 
		
		B2.addDebugTo(this, .5);
		addChild(new FPS(10, 10, 0xff0000));
	}

}
