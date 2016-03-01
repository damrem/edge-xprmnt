package controls;

import edge.ISystem;
import edge.View;
import openfl.events.KeyboardEvent;
import openfl.Lib;

/**
 * ...
 * @author damrem
 */
class KeyboardListener implements ISystem
{
	public static var pressedKeys:Map<Int, Bool>;
	public static var keyStates:Map<Int, KeyState>;
	
	public function new() 
	{
		pressedKeys = new Map<Int, Bool>();
		keyStates = new Map<Int, KeyState>();
		
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}
	
	function onKeyDown(e:KeyboardEvent):Void 
	{
		pressedKeys[e.keyCode] = true;
	}
	
	function onKeyUp(e:KeyboardEvent):Void 
	{
		pressedKeys[e.keyCode] = false;
	}
	
	public function update()
	{
	
		trace("update");
		for (key in pressedKeys.keys())
		{
			if (pressedKeys[key])
			{
				if (keyStates[key] == null || keyStates[key] == KeyState.Released || keyStates[key]==KeyState.JustReleased)
				{
					keyStates[key] = KeyState.JustPressed;
				}
				else
				{
					keyStates[key] = KeyState.Pressed;
				}
			}
			else
			{
				if (keyStates[key]==KeyState.Pressed || keyStates[key]==KeyState.JustPressed)
				{
					keyStates[key] = KeyState.JustReleased;
				}
				else
				{
					keyStates[key] = KeyState.Released;
				}
			}
		}
	}
	
}

