package maze.systems;

import edge.Entity;
import edge.ISystem;
import maze.components.TileCoreComponent;
import maze.components.TileMovement;
import rendering.components.Gfx;
import rendering.components.Layer;

/**
 * ...
 * @author damrem
 */
class ChangeTileLayer implements ISystem
{

	public function update(tileCore:TileCoreComponent, layer:Layer, tileMovement:TileMovement, gfx:Gfx) 
	{
		
	}
	
	public function updateRemoved(entity:Entity, node:{tileCore:TileCoreComponent, layer:Layer, tileMovement:TileMovement, gfx:Gfx})
	{
		//trace("updateRemoved");
		entity.remove(node.layer);
		entity.add(Main.tileLayers[node.tileMovement.toCell.y]);
		//trace(node.layer.screen.parent.getChildIndex(node.layer.screen.parent));
	}
	
}