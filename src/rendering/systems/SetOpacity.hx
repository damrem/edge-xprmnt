package rendering.systems;

import edge.Entity;
import edge.ISystem;
import rendering.components.Gfx;
import rendering.components.Opacity;

/**
 * ...
 * @author damrem
 */
class SetOpacity implements ISystem
{

	public function update(gfx:Gfx, opacity:Opacity) 
	{
		
	}
	
	public function updateAdded(entity:Entity, node: { gfx:Gfx, opacity:Opacity } )
	{
		node.gfx.display.alpha = node.opacity.alpha;
	}
	
	public function updateRemoved(entity:Entity, node: { gfx:Gfx, opacity:Opacity } )
	{
		node.gfx.display.alpha = 1.0;
	}
	
}