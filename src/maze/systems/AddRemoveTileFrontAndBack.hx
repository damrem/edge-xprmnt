package maze.systems;
import edge.Entity;
import edge.ISystem;
import maze.components.TileBack;
import maze.components.TileFront;
import rendering.components.Gfx;
import rendering.components.Layer;
using hxlpers.edge.EntityStaticExtension;
/**
 * ...
 * @author damrem
 */
class AddRemoveTileFrontAndBack implements ISystem
{

	public function update(tileFront:TileFront, tileBack:TileBack) 
	{
		
	}
	
	public function updateRemoved(entity:Entity, node: { tileFront:TileFront, tileBack:TileBack } )
	{
		var front = node.tileFront.entity;
		front.getFirstComponentOfType(Layer).scene1.removeChild(front.getFirstComponentOfType(Gfx).display)
	}
	
}