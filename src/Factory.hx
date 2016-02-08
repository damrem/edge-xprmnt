package;
import box2D.collision.shapes.B2CircleShape;
import box2D.collision.shapes.B2Shape;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2FixtureDef;

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
		var body = new BodyComponent(createShapedBody(new B2CircleShape(radius)));
		entity.push(body);
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
	
}