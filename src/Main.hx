package;

import b2d.B2;
import b2d.components.Body;
import b2d.components.Position;
import b2d.components.Shape;
import b2d.systems.BodyCreateFixture;
import b2d.systems.BodyDefSetPosition;
import b2d.systems.CreateBodyFromDef;
import b2d.systems.FixtureDefSetShape;
import b2d.systems.WorldDrawDebugData;
import b2d.systems.WorldStep;
import box2D.dynamics.B2BodyType;
import edge.World;
import hxlpers.shapes.BoxShape;
import hxlpers.shapes.DiskShape;
import maze.components.Aperture;
import maze.systems.BuildPhysicalTile;
import openfl.display.FPS;
import openfl.display.Sprite;
import rendering.components.Gfx;
import rendering.components.Layer;
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
		//edgeWorld.physics.add(new WorldDrawDebugData());
		
		edgeWorld.physics.add(new BodyDefSetPosition());
		edgeWorld.physics.add(new FixtureDefSetShape());
		edgeWorld.physics.add(new CreateBodyFromDef());
		edgeWorld.physics.add(new BodyCreateFixture());
		
		edgeWorld.physics.add(new BuildPhysicalTile());
		
		var mainLayer = new Layer(2);
		
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
		
		edgeWorld.engine.create([
			new Position(50, 50), 
			B2.bodyDef(B2BodyType.DYNAMIC_BODY), 
			B2.circleShape(50),
			B2.fixtureDef(1.0),
			new Body(),
			new Gfx(new DiskShape(50)),
			mainLayer
		]);
		
		edgeWorld.engine.create([
			new Position(150, 150), 
			B2.bodyDef(B2BodyType.DYNAMIC_BODY), 
			B2.rectShape(10, 10),
			B2.fixtureDef(1.0),
			new Body(),
			new Gfx(new BoxShape(10, 10)),
			mainLayer
		]);
		
		edgeWorld.engine.create([
			new Position(200, 200),
			B2.bodyDef(B2BodyType.KINEMATIC_BODY),
			new Aperture()
		]);
		
		addChild(new FPS(10, 10, 0xffffff));
	}

}
