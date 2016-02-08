package;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2World;

/**
 * ...
 * @author damrem
 */
class B2
{
	static var _world:B2World;
	static var gravity:B2Vec2;
	
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
	
}