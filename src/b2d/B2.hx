package b2d;
import b2d.components.ShapedFixtureDef;
import box2D.collision.shapes.B2CircleShape;
import box2D.collision.shapes.B2PolygonShape;
import box2D.collision.shapes.B2Shape;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2BodyType;
import box2D.dynamics.B2DebugDraw;
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
		B2.world.setDebugDraw(debugDraw);
		
	}
	
	public static function b2BodyDef(type:B2BodyType = B2BodyType.DYNAMIC_BODY):B2BodyDef
	{
		var bd = new B2BodyDef();
		bd.type = type;
		return bd;
	}
	
	public static function b2FixtureDef(density:Float = 1.0):B2FixtureDef
	{
		var fd = new B2FixtureDef();
		fd.density = density;
		return fd;
	}
	
	public static function shapedFixtureDef(shape:B2Shape, density:Float = 1.0):ShapedFixtureDef
	{
		return new ShapedFixtureDef(shape, b2FixtureDef(density));
	}
	
	public static function b2Rect(width:Float, height:Float, x:Float=0, y:Float=0, angle:Float=0):B2PolygonShape 
	{
		var shape = new B2PolygonShape();
		shape.setAsOrientedBox(width, height, new B2Vec2(x, y), angle);
		return shape;
	}
	
	public static function b2Circle(radius:Float):B2CircleShape
	{
		return new B2CircleShape(radius);
	}

}



