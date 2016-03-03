package maze.systems;


import edge.Entity;
import edge.ISystem;
import edge.View;
import hxlpers.Direction;
import hxlpers.Rnd;
import maze.components.Maze;
import maze.components.MazeMovement;
import maze.MazeConf;

/**
 * ...
 * @author damrem
 */
class MoveMazeRandomly implements ISystem
{
	var timeDelta:Float;
	var entity:Entity;

	var tt:Float = 0;
	var nextPeriod:Float;
	static inline var NEXT_PERIOD_MIN:Float = 2500;
	static inline var NEXT_PERIOD_MAX:Float = 7500;
	
	public function new() 
	{
		nextPeriod = Rnd.float(NEXT_PERIOD_MIN, NEXT_PERIOD_MAX);
	}
	
	public function update(maze:Maze) 
	{
		tt += timeDelta;
		
		if (tt > nextPeriod)
		{
			tt = 0;
			nextPeriod = Rnd.int(NEXT_PERIOD_MIN, NEXT_PERIOD_MAX);
			
			startMoving();
		}
	}
	
	function startMoving()
	{
		//trace("startMoving");
		
		var direction = Direction.None;
		var coord:Int = 0;
		
		switch(Std.random(4))
		{
			case 0:
				direction = Direction.Left;
				coord = Std.random(MazeConf.HEIGHT);
				
			case 1:
				direction = Direction.Up;
				coord = Std.random(MazeConf.WIDTH);
				
			case 2:
				direction = Direction.Right;
				coord = Std.random(MazeConf.HEIGHT);
				
			case 3:
				direction = Direction.Down;
				coord = Std.random(MazeConf.WIDTH);
		}
		
		if (direction != Direction.None)
		{
			entity.add(new MazeMovement(direction, coord));
		}
		
	}
	
}