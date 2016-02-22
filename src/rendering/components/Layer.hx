package rendering.components;
import edge.IComponent;
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
	public var image:BitmapData;
	public var scene:DisplayObjectContainer;
	
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
		image = new BitmapData(width, height, true, 0);
		scene = new Sprite();
	}
}