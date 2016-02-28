package b2d;
import box2D.collision.shapes.B2Shape;
import box2D.dynamics.B2FilterData;

/**
 * @author damrem
 */

typedef FixtureDefDef =
{
	@:optional var density:Float;
	@:optional var shape:B2Shape;
	@:optional var filter:B2FilterDataDef;
}