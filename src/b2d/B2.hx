package b2d;
import b2d.components.FixtureDef;
import box2D.collision.shapes.B2CircleShape;
import box2D.collision.shapes.B2PolygonShape;
import box2D.collision.shapes.B2Shape;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2BodyType;
import box2D.dynamics.B2DebugDraw;
import box2D.dynamics.B2FilterData;
import box2D.dynamics.B2FixtureDef;
import box2D.dynamics.B2World;
import edge.IComponent;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;

/**
 * ...
 * @author damrem
 */
class B2
{
	public static var world:B2World;
	public static var gravity:B2Vec2;
	public static var debugSprite:Sprite;
	public static var worldScale:Float = 1.0;
	
	/**
	 * Creates the box2d world.
	 * @param	gravity
	 * @param	doSleep
	 * @return	The Box2D world.
	 */
	public static function createWorld(?gravity:B2Vec2, doSleep:Bool=true):B2World
	{
		if (gravity == null)
		{
			B2.gravity = new B2Vec2();				
		}
		else
		{
			B2.gravity = gravity;
		}
		
		world = new B2World(B2.gravity, doSleep);
		
		return world;
	}
	
	public static function addDebugTo(container:DisplayObjectContainer, alpha = 1.0)
	{
		var debugDraw = new B2DebugDraw();
		
		debugSprite = new Sprite();
		debugSprite.alpha = alpha;
		container.addChild(debugSprite);
		debugDraw.setSprite(debugSprite);
		debugDraw.setDrawScale(B2.worldScale);
		debugDraw.setFlags(
		
			B2DebugDraw.e_aabbBit | 
			B2DebugDraw.e_centerOfMassBit | 
			B2DebugDraw.e_controllerBit | 
			B2DebugDraw.e_jointBit | 
			B2DebugDraw.e_pairBit | 
			B2DebugDraw.e_shapeBit
		);
		B2.world.setDebugDraw(debugDraw);
		
	}
	
	
	
	

}



