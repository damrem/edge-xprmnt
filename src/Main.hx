package;

import b2d.B2;
import b2d.components.Body;
import b2d.components.MultiShapedFixtureDef;
import b2d.components.Position;
import b2d.systems.BodyCreateShapedFixture;
import b2d.systems.BodyDefSetPosition;
import b2d.systems.CreateBodyFromDef;
import b2d.systems.WorldDrawDebugData;
import b2d.systems.WorldStep;
import box2D.dynamics.B2BodyType;
import edge.World;
import maze.systems.MoveMazeRandomly;
import maze.systems.MoveTile;

import maze.components.Aperture;
import maze.components.Maze;
import maze.factories.MazeGenerator;
import maze.systems.BuildPhysicalTile;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.events.MouseEvent;

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
		B2.addDebugTo(this);
		
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
		
		edgeWorld.physics.add(new BuildPhysicalTile());
		edgeWorld.physics.add(new BodyCreateShapedFixture());
		
		edgeWorld.physics.add(new MoveMazeRandomly());
		edgeWorld.physics.add(new MoveTile());
		
		
		
		
		//edgeWorld.physics.add(new BodyCreateFixture());
		
		//edgeWorld.physics.add(new CreateShape());
		edgeWorld.start();
		
		//	ENTITIES
		/*
		edgeWorld.engine.create(Factory.createBallEntity(100, 100, 50, 0, 0xff0000));
		edgeWorld.engine.create(Factory.createBallEntity(100, 100, 50, 0, 0xff0000));
		*/
		
		/*
		edgeWorld.engine.create([
			new Position(50, 50), 
			B2.shapedFixtureDef(B2.b2Circle(50), 1.0),
			new Body(B2.b2BodyDef(B2BodyType.DYNAMIC_BODY))
		]);
		
		edgeWorld.engine.create([
			new Position(150, 150), 
			B2.shapedFixtureDef(B2.b2Rect(10, 10), 1.0),
			new Body(B2.b2BodyDef(B2BodyType.DYNAMIC_BODY))
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
	}

}
