package b2d;

import box2D.collision.B2Manifold;
import box2D.dynamics.B2ContactImpulse;
import box2D.dynamics.B2ContactListener;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.contacts.B2Contact;

/**
 * ...
 * @author damrem
 */
class MultiContactListener extends B2ContactListener
{

	var contactListeners:Array<B2ContactListener>;
	
	public function new(?contactListeners:Array<B2ContactListener>) 
	{
		super();
		
		if (contactListeners == null)
		{
			contactListeners = [];
		}
		
		this.contactListeners = contactListeners;
		
	}
	
	override public function beginContact(contact:B2Contact)
	{
		for (contactListener in contactListeners)
		{
			contactListener.beginContact(contact);
		}
	}
	
	override public function endContact(contact:B2Contact)
	{
		for (contactListener in contactListeners)
		{
			contactListener.endContact(contact);
		}
	}
	
	override public function preSolve(contact:B2Contact, oldManifold:B2Manifold) {
		for (contactListener in contactListeners)
		{
			contactListener.preSolve(contact, oldManifold);
		}
	}
	
	override public function postSolve(contact:B2Contact, impulse:B2ContactImpulse) {
		for (contactListener in contactListeners)
		{
			contactListener.postSolve(contact, impulse);
		}
	}
	
}