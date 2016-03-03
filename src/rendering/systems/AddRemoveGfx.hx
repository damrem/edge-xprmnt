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
class AddRemoveGfx implements ISystem
{
	public function update(layer:Layer, gfx:Gfx) 
	{
		
	}
	
	public function updateAdded(e:Entity, node: { layer:Layer, gfx:Gfx } )
	{
		//trace("updateAdded");
		node.layer.scene1.addChild(node.gfx.display);
	}
	
	public function updateRemoved(e:Entity, node: { layer:Layer, gfx:Gfx } )
	{
		//trace("updateRemoved");
		node.layer.scene1.removeChild(node.gfx.display);
	}
	
}