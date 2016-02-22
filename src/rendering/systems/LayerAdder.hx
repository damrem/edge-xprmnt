package rendering.systems;
import edge.Entity;
import edge.ISystem;
import edge.View;
import openfl.display.BitmapData;
import rendering.components.Layer;

import openfl.display.DisplayObjectContainer;

/**
 * ...
 * @author damrem
 */
class LayerAdder implements ISystem
{
	var layer:View<{layer:Layer}>;
	
	var host:DisplayObjectContainer;
	
	public function new(host:DisplayObjectContainer)
	{
		this.host = host;	
	}
	
	public function update(layer:Layer)
	{
		host.addChild(new BitmapData(layer.image));
	}
	
	
	
	
}