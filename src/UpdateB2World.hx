package;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class UpdateB2World implements ISystem
{
	var timeDelta:Float;
	public function update(b2worldComponent:B2WorldComponent)
	{
		b2worldComponent.b2world.step(timeDelta, 8, 3);
	}
	
}