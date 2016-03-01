package heroes;

import b2d.components.Body;
import controls.KeyboardControlled;
import controls.KeyState;
import edge.ISystem;
import hxlpers.Direction;

/**
 * ...
 * @author damrem
 */
class HeroKeyboardController implements ISystem
{
	
	function update(body:Body, controlled:KeyboardControlled) 
	{
		var isLeftPressed = false;
		var isUpPressed = false;
		var isRightPressed = false;
		var isDownPressed = false;
		
		for (keyCode in controlled.keyStates.keys())
		{
			var state = controlled.keyStates[keyCode];
			var command = controlled.keyMap[keyCode];
			
			switch(command)
			{
				case HeroCommand.Left:
					isLeftPressed = state == KeyState.JustPressed || state == KeyState.Pressed;
					
				case HeroCommand.Up:
					isUpPressed = state == KeyState.JustPressed || state == KeyState.Pressed;
					
				case HeroCommand.Right:
					isRightPressed = state == KeyState.JustPressed || state == KeyState.Pressed;
					
				case HeroCommand.Down:
					isDownPressed = state == KeyState.JustPressed || state == KeyState.Pressed;
			}
			
		}
		

		if (isLeftPressed)
		{	
			controlled.hDirection = Direction.Left;
		}
		
		if (isUpPressed)
		{
			controlled.vDirection = Direction.Up;
		}
		
		if (isRightPressed)
		{
			controlled.hDirection = Direction.Right;
		}
		
		if (isDownPressed)
		{
			controlled.vDirection = Direction.Down;
		}
		
		if (!isLeftPressed && !isRightPressed)
		{
			controlled.hDirection = Direction.None;
		}
		
		if (!isUpPressed && !isDownPressed)
		{
			controlled.vDirection = Direction.None;
		}
		
		
		
		var mass = body.b2Body.getMass();
		
		switch(controlled.hDirection)
		{
			case Left:
				controlled.impulse.x = -controlled.reactivity * mass;
				
			case Right:
				controlled.impulse.x = controlled.reactivity * mass;
				
			default:
				controlled.impulse.x = 0;
		}
		
		switch(controlled.vDirection)
		{
			case Up:
				controlled.impulse.y = -controlled.reactivity * mass;
				
			case Down:
				controlled.impulse.y = controlled.reactivity * mass;
				
			default:
				controlled.impulse.y = 0;
		}
		
		
		if (controlled.impulse.x != 0 || controlled.impulse.y != 0) {			
			body.b2Body.applyImpulse(controlled.impulse, body.b2Body.getWorldCenter());
		}
		
	}
	
	
	
}

