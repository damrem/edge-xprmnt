package;
import b2d.B2;
import b2d.components.Body;
import b2d.components.BodyDef;
import b2d.components.FixtureDef;
import box2D.collision.shapes.B2CircleShape;
import box2D.collision.shapes.B2Shape;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2BodyType;
import box2D.dynamics.B2FixtureDef;
import edge.IComponent;

/**
 * ...
 * @author damrem
 */
class Factory
{
	static public function createShapedBody(shape:B2Shape):B2Body
	{
		var bodyDef = new B2BodyDef();
		
		var body = B2.world().createBody(bodyDef);
		var fixtureDef = new B2FixtureDef();
		fixtureDef.shape = shape;
		body.createFixture(fixtureDef);
		return body;
	}
	
	
	
	public static function createBallEntity(x:Float, y:Float, radius:Float, angle:Float, color:UInt):Array<{}>
	{
		var entity = new Array<{}>();
		/*
		var body = new b2d.components.BodyComponent(createShapedBody(new B2CircleShape(radius)));
		entity.push(body);
		*/
		/*
		var shape = new DiskShape(radius, color);
		var sprite = new EntitySprite(entity);
		sprite.addChild(shape);
		entity.add(new Gfx(sprite));
		
		var bodyDef = B2.createBodyDef(x, y);
		bodyDef.linearDamping = 25;
		var fixtureDef = B2.createFixtureDef();
		fixtureDef.shape = new B2CircleShape(radius);
		entity.add(new BodyComponent(bodyDef, fixtureDef));
		*/
		return entity;
	}
	
	public static function bodyDef(type:B2BodyType = B2BodyType.DYNAMIC_BODY):IComponent
	{
		var bd = new B2BodyDef();
		bd.type = type;
		return new BodyDef(bd);
	}
	
	public static function fixtureDef(density:Float = 1.0):IComponent
	{
		var fd = new B2FixtureDef();
		fd.density = density;
		return new FixtureDef(fd);
	}
	
}