package;

import b2d.B2;
import b2d.components.Body;
import b2d.components.MultiShapedFixtureDef;
import b2d.components.Impulse;
import b2d.components.Position;
import b2d.systems.BodyCreateShapedFixture;
import b2d.systems.BodyDefSetPosition;
import b2d.components.Shape;
import b2d.systems.BodyApplyImpulse;
import b2d.systems.BodyCreateFixture;
import b2d.systems.BodyDefSetPosition;
import b2d.systems.CreateBodyFromDef;
import b2d.systems.FixtureDefSetShape;
import b2d.systems.WorldDrawDebugData;
import b2d.systems.WorldStep;
import box2D.dynamics.B2BodyType;
import edge.World;
import maze.systems.MoveMazeRandomly;

import hxlpers.shapes.BoxShape;
import hxlpers.shapes.DiskShape;
import maze.components.Aperture;
import maze.components.Maze;
import maze.factories.MazeGenerator;
import maze.systems.BuildPhysicalTile;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import rendering.components.Gfx;
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
		edgeWorld.physics.add(new BodyCreateShapedFixture());
		
		edgeWorld.physics.add(new MoveMazeRandomly());
		
		
		
		
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
		
		edgeWorld.engine.create([new Maze(tiles)]);
		
		for (tile in tiles)
		{
			edgeWorld.engine.create(tile);
		}
		
		addChild(new FPS(10, 10, 0xff0000));
		
		//addEventListener(MouseEvent.CLICK, 
		
		B2.addDebugTo(this, .5);
		addChild(new FPS(10, 10, 0xffffff));
	}

}
