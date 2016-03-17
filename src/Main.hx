package;

import b2d.B2;
import b2d.systems.BodyApplyImpulse;
import b2d.systems.BodyCreateFixture;
import b2d.systems.CreateBody;
import b2d.systems.WorldDrawDebugData;
import b2d.systems.WorldStep;
import controls.KeyboardCommandSet;
import controls.KeyboardController;
import controls.KeyboardListener;
import de.polygonal.ds.Array2.Array2Cell;
import edge.World;
import heroes.PlayerCommand;
import heroes.PlayerFactory;
import heroes.PlayerKeyboardController;
import items.ArrowItemFactory;
import maze.components.Maze;
import maze.factories.MazeGenerator;
import maze.MazeConf;
import maze.systems.BuildPhysicalTile;
import maze.systems.DrawTile;
import maze.systems.MoveMaze;
import maze.systems.MoveMazeRandomly;
import maze.systems.MoveTile;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.ui.Keyboard;
import playertile.ContactListener;
import playertile.MovePlayerWithTile;
import rendering.components.Layer;
import rendering.RenderingConf;
import rendering.systems.AddRemoveGfx;
import rendering.systems.PositionGfx;
import rendering.systems.RenderLayer;
import rendering.systems.SetOpacity;



using hxlpers.display.ShapeSF;

/**
 * ...
 * @author damrem
 */
class Main extends Sprite 
{
	public static var mainLayer:Layer;
	public static var maze:Maze;

	public static inline var PLAYER_CATEGORY:Int = 0x0002;
	public static inline var TILE_CATEGORY:Int = 0x0004;
	public static inline var BORDER_CATEGORY:Int = 0x0008;
	
	public static inline var PLAYER_MASK:Int = TILE_CATEGORY | BORDER_CATEGORY;
	public static inline var TILE_MASK:Int = PLAYER_CATEGORY;
	public static inline var BORDER_MASK:Int = PLAYER_CATEGORY;
	
	public function new() 
	{
		super();
		
		var edgeWorld = new World();
		B2.createWorld();
		B2.world.setContactListener(new ContactListener());
		
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
		edgeWorld.frame.add(new KeyboardListener());
		edgeWorld.frame.add(new KeyboardController());
		
		edgeWorld.physics.add(new CreateBody());
		
		edgeWorld.physics.add(new BuildPhysicalTile());
		edgeWorld.physics.add(new BodyCreateFixture());
		
		edgeWorld.physics.add(new BodyApplyImpulse());
		
		edgeWorld.physics.add(new PlayerKeyboardController());
		
		edgeWorld.physics.add(new MoveMazeRandomly());
		edgeWorld.physics.add(new MoveMaze());
		edgeWorld.physics.add(new MoveTile());
		edgeWorld.physics.add(new MovePlayerWithTile());
		
		edgeWorld.physics.add(new WorldStep());
		
		#if debug
		edgeWorld.physics.add(new WorldDrawDebugData());
		#end
		

		
		
		
		
		
		
		
		//edgeWorld.physics.add(new BodyCreateFixture());
		
		
		mainLayer = new Layer(RenderingConf.PIXEL_SIZE);
		
		edgeWorld.render.add(new RenderLayer(this, [mainLayer]));
		edgeWorld.render.add(new DrawTile());
		edgeWorld.render.add(new AddRemoveGfx());
		edgeWorld.render.add(new PositionGfx());
		edgeWorld.render.add(new SetOpacity());
		
		//edgeWorld.physics.add(new CreateShape());
		edgeWorld.start();
		
		//	ENTITIES
		/*
		edgeWorld.engine.create(Factory.createBallEntity(100, 100, 50, 0, 0xff0000));
		edgeWorld.engine.create(Factory.createBallEntity(100, 100, 50, 0, 0xff0000));
		*/
		
		//var disk = new openfl.display.Shape();
		//disk.circle(50, 0xff0000);
		
		edgeWorld.engine.create([mainLayer]);
		
		
		
		
		
		
		
/*		
		edgeWorld.engine.create([
			new Body( {
				x:250,
				y:350,
				type:B2BodyType.DYNAMIC_BODY
			}),
			new FixtureDef( {
				
				shape: new B2RectShape( {
					width:24,
					height:24
				}),
				density:1.0,
				filter: {
					categoryBits:HERO_CATEGORY,
					maskBits:HERO_MASK
				}
			}),
			new Gfx(new BoxShape(24, 24)),
			mainLayer,
			new Impulse(-0.01,-0.02)
		]);
*/		
		/*
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
		
		
		var tileEnts = MazeGenerator.createEnts(edgeWorld.engine, MazeConf.WIDTH, MazeConf.HEIGHT);
		
		maze = new Maze(tileEnts);
		
		edgeWorld.engine.create([maze]);
		
		edgeWorld.engine.create(ArrowItemFactory.createComps(new Array2Cell()));
		
		
		
		Borders.create(edgeWorld.engine);
		
		
		
		
		
		
		
		
		
		
		
		
		edgeWorld.engine.create(PlayerFactory.createComponents(
			new Array2Cell(0, 0), 
			new KeyboardCommandSet([
				Keyboard.Q => PlayerCommand.Left,
				Keyboard.Z => PlayerCommand.Up,
				Keyboard.D => PlayerCommand.Right,
				Keyboard.S => PlayerCommand.Down,
				Keyboard.SPACE => PlayerCommand.Shoot
			]),
			mainLayer
		));
		
		/*
		edgeWorld.engine.create(PlayerFactory.createComponents(
			new Array2Cell(MazeConf.WIDTH - 1, MazeConf.HEIGHT - 1), 
			new KeyboardCommandSet([
				Keyboard.LEFT => PlayerCommand.Left,
				Keyboard.UP => PlayerCommand.Up,
				Keyboard.RIGHT => PlayerCommand.Right,
				Keyboard.DOWN => PlayerCommand.Down,
				Keyboard.SPACE => PlayerCommand.Shoot
			]),
			mainLayer
		));
		*/
		//addEventListener(MouseEvent.CLICK, 
		
		B2.addDebugTo(this, .5);
		addChild(new FPS(10, 10, 0xff0000));
	}

}
