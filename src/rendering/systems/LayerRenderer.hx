package rendering.systems;
import edge.Entity;
import edge.ISystem;
import edge.View;
import openfl.display.DisplayObjectContainer;
import rendering.components.Gfx;
import rendering.components.Layer;

/**
 * ...
 * @author damrem
 */
class LayerRenderer implements ISystem
{
	var host:DisplayObjectContainer;
	
	public function new(host:DisplayObjectContainer)
	{
		this.host = host;
	}
	
	public function update(layer:Layer, gfx:Gfx) 
	{
		
	}
	
	public function updateAdded(e:Entity, node: { layer:Layer, gfx:Gfx } )
	{
		trace("updateAdded");
		node.layer.scene.addChild(node.gfx.sprite);
	}
	
}