package rendering.components;
import edge.IComponent;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;
import openfl.Lib;

/**
 * ...
 * @author damrem
 */
class Layer implements IComponent
{
	public var scene:DisplayObjectContainer;
	public var image:BitmapData;
	public var screen:Bitmap;
	
	public function new(?width:Int, ?height:Int)
	{
		if (width == null)
		{
			width = Lib.current.stage.stageWidth;
		}
		if (height == null)
		{
			height = Lib.current.stage.stageHeight;
		}
		scene = new Sprite();
		image = new BitmapData(width, height, true, 0);
		screen = new Bitmap(image);
	}
}