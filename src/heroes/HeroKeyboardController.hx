package heroes;

import b2d.components.Body;
import box2D.common.math.B2Vec2;
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
	
	function update(body:Body, controlled:KeyboardControlled, heroControl:HeroReactivity) 
	{
		var isLeftPressed = false;
		var isUpPressed = false;
		var isRightPressed = false;
		var isDownPressed = false;
		
		var hDirection = Direction.None;
		var vDirection = Direction.None;
		var impulse = new B2Vec2();
		
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
				impulse.x = -heroControl.reactivity * mass;
				
			case Right:
				impulse.x = heroControl.reactivity * mass;
				
			default:
				impulse.x = 0;
		}
		
		switch(vDirection)
		{
			case Up:
				impulse.y = -heroControl.reactivity * mass;
				
			case Down:
				impulse.y = heroControl.reactivity * mass;
				
			default:
				impulse.y = 0;
		}
		
		
		if (impulse.x != 0 || impulse.y != 0) {			
			body.b2Body.applyImpulse(impulse, body.b2Body.getWorldCenter());
		}
		
	}
	
	
	
}

