package b2d.components;
import box2D.collision.shapes.B2Shape;
import box2D.dynamics.B2FixtureDef;
import edge.IComponent;

/**
 * ...
 * @author damrem
 */
class ShapedFixtureDef implements IComponent
{
	public var b2Shape:B2Shape;	
	public var b2FixtureDef:B2FixtureDef;
}