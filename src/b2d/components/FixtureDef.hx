package b2d.components;
import b2d.FixtureDefDef;
import box2D.collision.shapes.B2Shape;
import box2D.dynamics.B2FixtureDef;
import edge.IComponent;

/**
 * ...
 * @author damrem
 */
class FixtureDef implements IComponent
{
	public var b2FixtureDef:B2FixtureDef;
	
	public function new(fixtureDefDef:FixtureDefDef)
	{
		b2FixtureDef = new B2FixtureDef();
		
		b2FixtureDef.density = fixtureDefDef.density;
		
		if (fixtureDefDef.shape != null)
		{
			b2FixtureDef.shape = fixtureDefDef.shape;
		}
		
		if (fixtureDefDef.filter != null)
		{
			b2FixtureDef.filter.categoryBits = fixtureDefDef.filter.categoryBits;
			b2FixtureDef.filter.maskBits = fixtureDefDef.filter.maskBits;
		}
	}
}