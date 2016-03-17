package b2d.collisions;

import box2D.dynamics.B2Fixture;
import edge.Entity;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class RegisterContacts implements ISystem
{

	public function new() 
	{
		
	}
	
	public function update(contact:ContactComponent)
	{
		
	}
	
	public function updateAdded(contactEntity:Entity, node: { contact:ContactComponent } )
	{
		addContactToFixture(node.contact.fixtureA, contactEntity);
		addContactToFixture(node.contact.fixtureB, contactEntity);
	}
	
	function addContactToFixture(fixture:B2Fixture, contactEntity:Entity)
	{
		var entity:Entity = cast(fixture.getUserData());
		var contactEntityList:ContactEntityList;
		if (!entity.existsType(ContactEntityList))
		{
			contactEntityList = new ContactEntityList();
			entity.add(contactEntityList);
		}
		else
		{
			contactEntityList = entity.getFirstComponentOfType(ContactEntityList);
		}
		contactEntityList.push(contactEntity);
	}
	
}