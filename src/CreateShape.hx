package;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2World;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class CreateShape implements ISystem
{
	var timeDelta:Float;
	var entity:Entity;

	/**
	 * Called once per entity whose set of components matches the function arguments.
	 * @param	body
	 */
	public function update(body:BodyComponent, shape:B2ShapeComponent)
	{
		trace("update", body.b2body);
	}
	
	
	
}