package b2d;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2FixtureDef;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2DebugDraw;
import box2D.dynamics.B2World;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;

/**
 * ...
 * @author damrem
 */
class B2
{
	static var _world:B2World;
	static var gravity:B2Vec2;
	static var debugSprite:Sprite;
	
	/**
	 * Returns the box2d world, after creating it if needed.
	 * @param	gravity
	 * @param	doSleep
	 * @return	The Box2D world.
	 */
	public static function world(?gravity:B2Vec2, doSleep:Bool=true):B2World
	{
		if (_world == null && B2.gravity == null)
		{
			if (gravity == null)
			{
				B2.gravity = new B2Vec2();				
			}
			else
			{
				B2.gravity = gravity;
			}
			_world = new B2World(B2.gravity, doSleep);
		}
		return _world;
	}
	
	public static function addDebugTo(container:DisplayObjectContainer)
	{
		var debugDraw = new B2DebugDraw();
		
		debugSprite = new Sprite();
		container.addChild(debugSprite);
		debugDraw.setSprite(debugSprite);
		debugDraw.setDrawScale(1);
		debugDraw.setFlags(
		
			B2DebugDraw.e_aabbBit | 
			B2DebugDraw.e_centerOfMassBit | 
			B2DebugDraw.e_controllerBit | 
			B2DebugDraw.e_jointBit | 
			B2DebugDraw.e_pairBit | 
			B2DebugDraw.e_shapeBit
		);
		B2.world().setDebugDraw(debugDraw);
		
	}
	
	public static function getDebug():Sprite
	{
		return debugSprite;
	}
	
}



