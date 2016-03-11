package heroes;

import b2d.components.Body;
import box2D.common.math.B2Vec2;
import controls.KeyboardCommandSet;
import controls.KeyState;
import edge.ISystem;
import hxlpers.Direction;

/**
 * ...
 * @author damrem
 */
class PlayerKeyboardController implements ISystem
{
	
	function update(body:Body, controlled:KeyboardCommandSet, playerControl:PlayerCoreComponent) 
	{
		var isLeftPressed = false;
		var isUpPressed = false;
		var isRightPressed = false;
		var isDownPressed = false;
		
		var hDirection = Direction.None;
		var vDirection = Direction.None;
		var force = new B2Vec2();
		
		for (keyCode in controlled.keyStates.keys())
		{
			var state = controlled.keyStates[keyCode];
			var command = controlled.keyMap[keyCode];
			
			switch(command)
			{
				case PlayerCommand.Left:
					isLeftPressed = state == KeyState.JustPressed || state == KeyState.Pressed;
					
				case PlayerCommand.Up:
					isUpPressed = state == KeyState.JustPressed || state == KeyState.Pressed;
					
				case PlayerCommand.Right:
					isRightPressed = state == KeyState.JustPressed || state == KeyState.Pressed;
					
				case PlayerCommand.Down:
					isDownPressed = state == KeyState.JustPressed || state == KeyState.Pressed;
			}
			
		}
		

		if (isLeftPressed)
		{	
			hDirection = Direction.Left;
		}
		
		if (isUpPressed)
		{
			vDirection = Direction.Up;
		}
		
		if (isRightPressed)
		{
			hDirection = Direction.Right;
		}
		
		if (isDownPressed)
		{
			vDirection = Direction.Down;
		}
		
		if (!isLeftPressed && !isRightPressed)
		{
			hDirection = Direction.None;
		}
		
		if (!isUpPressed && !isDownPressed)
		{
			vDirection = Direction.None;
		}
		
		
		
		var mass = body.b2Body.getMass();
		
		switch(hDirection)
		{
			case Left:
				force.x = -playerControl.reactivity * mass;
				
			case Right:
				force.x = playerControl.reactivity * mass;
				
			default:
				force.x = 0;
		}
		
		switch(vDirection)
		{
			case Up:
				force.y = -playerControl.reactivity * mass;
				
			case Down:
				force.y = playerControl.reactivity * mass;
				
			default:
				force.y = 0;
		}
		
		
		if (force.x != 0 || force.y != 0) {			
			body.b2Body.applyForce(force, body.b2Body.getWorldCenter());
		}
		
	}
	
	
	
}

