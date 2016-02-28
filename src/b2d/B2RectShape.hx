package b2d;

import b2d.B2RectShape.B2RectShapeDef;
import box2D.collision.shapes.B2PolygonShape;
import box2D.common.math.B2Vec2;

/**
 * ...
 * @author damrem
 */
class B2RectShape extends B2PolygonShape
{

	public function new(def:B2RectShapeDef) 
	{
		super();
		if (def.x == null)
		{
			def.x = 0;
		}
		if (def.y == null)
		{
			def.y = 0;
		}
		if (def.angle == null)
		{
			def.angle = 0;
		}
		setAsOrientedBox(def.width/2, def.height/2, new B2Vec2(def.x, def.y), def.angle);
	}
	
}

typedef B2RectShapeDef = {
	var width:Float;
	var height:Float;
	@:optional var x:Float;
	@:optional var y:Float;
	@:optional var angle:Float;
}