package b2d.systems;
import b2d.B2;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class WorldStep implements ISystem
{
	var timeDelta:Float;
	public function update()
	{
		B2.world().step(timeDelta, 8, 3);
	}
	
}