package rendering.systems;
import edge.ISystem;
import openfl.display.DisplayObjectContainer;
import rendering.components.Layer;

using hxlpers.display.BitmapDataSF;

/**
 * ...
 * @author damrem
 */
class RenderLayer implements ISystem
{
	var host:DisplayObjectContainer;
	
	public function new(host:DisplayObjectContainer, ?layers:Array<Layer>)
	{
		this.host = host;
		if (layers != null)
		{
			for (layer in layers)
			{
				addLayer(layer);
			}
		}
	}
	
	public function addLayer(layer:Layer)
	{
		host.addChild(layer.screen);
	}
	
	public function removeLayer(layer:Layer)
	{
		host.removeChild(layer.screen);
		
	}
	
	public function update(layer:Layer)
	{
		layer.image.clear(0x00000000);
		layer.image.draw(layer.scene0);
	}
	
	/*
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
	*/
	
	
	
	
}