package;

import edge.World;
import openfl.display.Sprite;
import openfl.Lib;

/**
 * ...
 * @author damrem
 */
class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		var world = new World();
		
		world.physics.add(new UpdateB2World());
		world.physics.add(new CreateShape());
		world.start();
		
		world.engine.create([new B2WorldComponent(B2.world())]);
		
		world.engine.create(Factory.createBallEntity(100, 100, 50, 0, 0xff0000));
		world.engine.create(Factory.createBallEntity(100, 100, 50, 0, 0xff0000));
	}

}
