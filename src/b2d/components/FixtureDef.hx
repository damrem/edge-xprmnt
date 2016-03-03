package b2d.components;
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
		
		b2FixtureDef.shape = fixtureDefDef.shape;
		
		b2FixtureDef.density = fixtureDefDef.density;
		
		if (fixtureDefDef.filter != null)
		{
			b2FixtureDef.filter.categoryBits = fixtureDefDef.filter.categoryBits;
			b2FixtureDef.filter.maskBits = fixtureDefDef.filter.maskBits;
		}
		
		if (fixtureDefDef.isSensor != null)
		{
			b2FixtureDef.isSensor = fixtureDefDef.isSensor;
		}
		else
		{
			b2FixtureDef.isSensor = false;
		}
	}
}

typedef FixtureDefDef =
{
	var shape:B2Shape;
	@:optional var density:Float;
	@:optional var filter:B2FilterDataDef;
	@:optional var isSensor:Bool;
}

typedef B2FilterDataDef =
{
	categoryBits:Int,
	maskBits:Int
}