package;

import b2d.B2;
import b2d.components.BodyComponent;
import b2d.components.PositionComponent;
import b2d.components.ShapeComponent;
import b2d.systems.BodyCreateFixture;
import b2d.systems.CreateBodyFromDef;
import b2d.systems.WorldDrawDebugData;
import b2d.systems.BodyDefSetPosition;
import b2d.systems.FixtureDefSetShape;
import b2d.systems.WorldStep;
import box2D.collision.shapes.B2CircleShape;
import box2D.dynamics.B2BodyType;
import edge.World;
import openfl.display.Sprite;

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
		var b2World = b2d.B2.world();
		b2d.B2.addDebugTo(this);
		
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
		edgeWorld.physics.add(new FixtureDefSetShape());
		edgeWorld.physics.add(new CreateBodyFromDef());
		edgeWorld.physics.add(new BodyCreateFixture());
		//edgeWorld.physics.add(new CreateShape());
		edgeWorld.start();
		
		//	ENTITIES
		/*
		edgeWorld.engine.create(Factory.createBallEntity(100, 100, 50, 0, 0xff0000));
		edgeWorld.engine.create(Factory.createBallEntity(100, 100, 50, 0, 0xff0000));
		*/
		edgeWorld.engine.create([
			new PositionComponent(50, 50), 
			Factory.bodyDef(B2BodyType.DYNAMIC_BODY), 
			new ShapeComponent(new B2CircleShape(50)),
			Factory.fixtureDef(1.0),
			new BodyComponent()
		]);
	}

}
