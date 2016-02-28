package rendering.systems;
import edge.Entity;
import edge.ISystem;
import edge.View;
import openfl.display.BitmapData;
import rendering.components.Layer;

import openfl.display.DisplayObjectContainer;
using hxlpers.display.BitmapDataSF;

/**
 * ...
 * @author damrem
 */
class RenderLayer implements ISystem
{
	var host:DisplayObjectContainer;
	
	public function new(host:DisplayObjectContainer)
	{
		this.host = host;	
	}
	
	public function update(layer:Layer)
	{
		layer.image.clear(0xff00ff00);
		layer.image.draw(layer.scene0);
	}
	
	public function updateAdded(entity:Entity, node:{layer:Layer})
	{
		trace("updateAdded");
		host.addChild(node.layer.screen);
	}
	
	public function updateRemoved(entity:Entity, node:{layer:Layer})
	{
		trace("updateRemoved");
		host.removeChild(node.layer.screen);
	}
	
	
	
	
}