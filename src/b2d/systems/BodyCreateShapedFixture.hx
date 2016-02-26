package b2d.systems;
import b2d.components.Body;
import b2d.components.MultiShapedFixtureDef;
import b2d.components.ShapedFixtureDef;
import edge.Entity;
import edge.ISystem;
import edge.View;

/**
 * ...
 * @author damrem
 */
class BodyCreateShapedFixture implements ISystem
{
	var multiShapeFixtureDefNode:View<{ body:Body, multiShapedFixtureDef:MultiShapedFixtureDef }>;
	
	public function update(body:Body, shapedFixtureDef:ShapedFixtureDef)
	{
		
	}
	
	public function updateAdded(e:Entity, node:{ body:Body, shapedFixtureDef:ShapedFixtureDef }) 
	{
		node.shapedFixtureDef.b2FixtureDef.shape = node.shapedFixtureDef.b2Shape;
		node.body.b2Body.createFixture(node.shapedFixtureDef.b2FixtureDef);
	}
	
	public function multiShapeFixtureDefNodeAdded(e:Entity, node: { body:Body, multiShapedFixtureDef:MultiShapedFixtureDef } )
	{
		for (shapedFixtureDef in node.multiShapedFixtureDef.shapedFixtureDefs)
		{
			shapedFixtureDef.b2FixtureDef.shape = shapedFixtureDef.b2Shape;
			node.body.b2Body.createFixture(shapedFixtureDef.b2FixtureDef);
		}
	}
	
}