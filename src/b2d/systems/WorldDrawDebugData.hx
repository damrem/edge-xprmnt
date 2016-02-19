package b2d.systems;
import b2d.B2;
import edge.ISystem;

/**
 * ...
 * @author damrem
 */
class WorldDrawDebugData implements ISystem
{

	public function update() 
	{
		B2.world().drawDebugData();
	}
	
}