package b2d.systems;
import b2d.components.Body;
import b2d.components.MultiFixtureDef;
import b2d.components.FixtureDef;
import edge.Entity;
import edge.ISystem;
import edge.View;

/**
 * ...
 * @author damrem
 */
class BodyCreateFixture implements ISystem
{
	var multiShapeFixtureDefNode:View<{ body:Body, multiShapedFixtureDef:MultiFixtureDef }>;
	
	public function update(body:Body, shapedFixtureDef:FixtureDef)
	{
		
	}
	
	public function updateAdded(e:Entity, node:{ body:Body, shapedFixtureDef:FixtureDef }) 
	{
		trace("updateAdded");
		node.shapedFixtureDef.b2FixtureDef.shape = node.shapedFixtureDef.b2FixtureDef.shape;
		node.body.b2Body.createFixture(node.shapedFixtureDef.b2FixtureDef);
	}
	
	public function multiShapeFixtureDefNodeAdded(e:Entity, node: { body:Body, multiShapedFixtureDef:MultiFixtureDef } )
	{
		for (shapedFixtureDef in node.multiShapedFixtureDef.shapedFixtureDefs)
		{
			shapedFixtureDef.b2FixtureDef.shape = shapedFixtureDef.b2FixtureDef.shape;
			node.body.b2Body.createFixture(shapedFixtureDef.b2FixtureDef);
		}
	}
	
}