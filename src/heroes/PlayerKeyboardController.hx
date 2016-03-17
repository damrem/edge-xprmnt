package heroes;

import b2d.B2;
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
		
		var hDirection:Direction = null;
		var vDirection:Direction = null;
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
		
		if (!isLeftPressed && !isRightPressed)
		{
			hDirection = null;
		}
		else if (isLeftPressed && isRightPressed)
		{
			hDirection = null;
		}
		else if (isLeftPressed)
		{	
			hDirection = Direction.Left;
		}
		else if (isRightPressed)
		{
			hDirection = Direction.Right;
		}

		
		if (!isUpPressed && !isDownPressed)
		{
			vDirection = null;
		}
		else if (isUpPressed && isDownPressed)
		{
			vDirection = null;
		}
		else if (isUpPressed)
		{
			vDirection = Direction.Up;
		}
		else if (isDownPressed)
		{
			vDirection = Direction.Down;
		}
				
		var mass = body.b2Body.getMass();
		
		if (hDirection != null)
		{
			switch(hDirection)
			{
				case Left:
					force.x = -playerControl.reactivity * mass / B2.worldScale / B2.worldScale;
					
				case Right:
					force.x = playerControl.reactivity * mass / B2.worldScale / B2.worldScale;
					
				default:
					force.x = 0;
			}
		}
		
		if (vDirection != null)
		{
			switch(vDirection)
			{
				case Up:
					force.y = -playerControl.reactivity * mass / B2.worldScale / B2.worldScale;
					
				case Down:
					force.y = playerControl.reactivity * mass / B2.worldScale / B2.worldScale;
					
				default:
					force.y = 0;
			}
		}
		
		if (force.x != 0 || force.y != 0) {			
			body.b2Body.applyForce(force, body.b2Body.getWorldCenter());
		}
		
	}
	
	
	
}

