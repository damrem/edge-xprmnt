package controls;

import b2d.components.Body;
import edge.ISystem;
import edge.View;
import openfl.events.KeyboardEvent;
import openfl.Lib;

/**
 * ...
 * @author damrem
 */
class KeyboardController implements ISystem
{
	function update(controlled:KeyboardCommandSet) 
	{
		//trace("controlledNodeUpdate");
		for (keyCode in controlled.keyMap.keys())
		{
			if (KeyboardListener.keyStates[keyCode] != null)
			{
				controlled.keyStates[keyCode] = KeyboardListener.keyStates[keyCode];
				//trace(controlled.keyStates);
			}
		}
		
	}
	
	
	
}

