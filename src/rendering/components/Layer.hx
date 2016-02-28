package rendering.components;
import edge.IComponent;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;
import openfl.Lib;
using hxlpers.display.DisplayObjectSF;
/**
 * ...
 * @author damrem
 */
class Layer implements IComponent
{
	public var scene0:DisplayObjectContainer;
	public var scene1:DisplayObjectContainer;
	public var image:BitmapData;
	public var screen:Bitmap;
	
	public function new(pixelSize:Int=1, ?width:Int, ?height:Int)
	{
		if (width == null)
		{
			width = Lib.current.stage.stageWidth;
		}
		if (height == null)
		{
			height = Lib.current.stage.stageHeight;
		}
		
		scene0 = new Sprite();
		scene1 = new Sprite();
		scene0.addChild(scene1);
		scene1.scale(1 / pixelSize);
		
		image = new BitmapData(Std.int(width / pixelSize), Std.int(height / pixelSize), true, 0x00ff00);
		
		screen = new Bitmap(image);
		screen.scale(pixelSize);
	}
}