package maze.systems;

import edge.Entity;
import edge.ISystem;
import maze.components.TileBack;
import maze.components.TileCoreComponent;
import maze.components.TileFront;
import maze.components.TileMovement;
import rendering.components.Layer;
/**
 * ...
 * @author damrem
 */
class ChangeTileLayer implements ISystem
{

	public function update(tileCore:TileCoreComponent, tileFront:TileFront, tileBack:TileBack, tileMovement:TileMovement) 
	{
		
	}
	
	public function updateRemoved(entity:Entity, node:{tileCore:TileCoreComponent, tileFront:TileFront, tileBack:TileBack, tileMovement:TileMovement})
	{
		//entity.remove(node.layer);
		//entity.add(Main.tileLayers[node.tileMovement.toCell.y]);
		//entity.add(Main.layers[node.tileMovement.toCell.y]);
		
		var backEntity:Entity = node.tileBack.entity;
		backEntity.removeType(Layer);
		backEntity.add(Main.layers.get(node.tileMovement.toCell.y + 1, 0));
		
		var frontEntity:Entity = node.tileFront.entity;
		frontEntity.removeType(Layer);
		frontEntity.add(Main.layers.get(node.tileMovement.toCell.y + 1, 2));
		
	}
	
}