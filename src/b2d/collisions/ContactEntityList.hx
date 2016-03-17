package b2d.collisions;

import b2d.collisions.ContactComponent;
import edge.IComponent;

/**
 * ...
 * @author damrem
 */
class ContactEntityList implements IComponent
{
	public var contacts:Array<ContactComponent>;
	public function new() 
	{
		contacts = [];
	}
	
}