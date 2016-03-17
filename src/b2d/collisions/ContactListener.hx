package b2d.collisions;

import b2d.collisions.ContactComponent;
import b2d.collisions.ContactEntityList;
import box2D.dynamics.B2ContactListener;
import box2D.dynamics.B2Fixture;
import edge.Engine;
import edge.Entity;

using hxlpers.edge.EntityStaticExtension;
/**
 * ...
 * @author damrem
 */
class ContactListener extends B2ContactListener
{
	var engine:Engine;

	public function new(engine:Engine) 
	{
		super();
		this.engine = engine;
		
	}
	
	override public function beginContact(fixtureA:B2Fixture, fixtureB:B2Fixture)
	{
		var contact = new ContactComponent(fixtureA, fixtureB);
		engine.create([contact]);
	}
	
	override public function endContact(fixtureA:B2Fixture, fixtureB:B2Fixture)
	{
		var entityA:Entity = cast(fixtureA.getUserData());
		var contactEntityListA = entityA.getFirstComponentOfType(ContactEntityList);
		
		
		var entityB:Entity = cast(fixtureB);
	}
	
	
	
}