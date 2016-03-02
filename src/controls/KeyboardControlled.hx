package controls;
import box2D.common.math.B2Vec2;
import edge.IComponent;
import hxlpers.Direction;


/**
 * ...
 * @author damrem
 */
class KeyboardControlled implements IComponent
{
	public var keyMap:Map<Int, Dynamic>;
	public var keyStates:Map<Int, KeyState>;

	public function new(?keyMap:Map<Int, Dynamic>)
	{
		this.keyMap = keyMap == null ? new Map<Int, Dynamic>() : keyMap;
		keyStates = new Map<Int, KeyState>();
		
	}
	
}
