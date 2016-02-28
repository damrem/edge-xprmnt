package hxlpers.shapes;

import flash.display.Shape;

/**
 * ...
 * @author damrem
 */
class BoxShape extends ShortcutShape
{
	var centered:Bool;

	public function new(Width:Float = 10.0, Height:Float = 10.0, FillColor:UInt = 0xff0000, Thickness:Float=0.0, StrokeColor:UInt=0x000000, Centered:Bool=true) 
	{
		super(FillColor, Thickness, StrokeColor);
		this.centered = Centered;
		graphics.drawRect(centered? -Width:0, centered? -Height:0, Width*2, Height*2);
		endFill();
	}
	
	
	
}