package b2d.systems;
import b2d.components.Body;
import b2d.components.MultiFixtureDef;
import b2d.components.Fixture;
import edge.Entity;
import edge.ISystem;
import edge.View;

/**
 * ...
 * @author damrem
 */
class BodyCreateFixture implements ISystem
{
	var multiFixtureDefNode:View<{ body:Body, multiFixtureDef:MultiFixtureDef }>;
	
	public function update(body:Body, fixtureDef:Fixture)
	{
		
	}
	
	public function updateAdded(entity:Entity, node:{ body:Body, fixtureDef:Fixture }) 
	{
		//trace("updateAdded");
		//node.fixtureDef.b2FixtureDef.shape = node.fixtureDef.b2FixtureDef.shape;
		node.fixtureDef.b2FixtureDef.userData = entity;
		node.body.b2Body.createFixture(node.fixtureDef.b2FixtureDef);
	}
	
	public function multiFixtureDefNodeAdded(entity:Entity, node: { body:Body, multiFixtureDef:MultiFixtureDef } )
	{
		for (fixtureDef in node.multiFixtureDef.fixtureDefs)
		{
			//fixtureDef.b2FixtureDef.shape = fixtureDef.b2FixtureDef.shape;
			fixtureDef.b2FixtureDef.userData = entity;
			node.body.b2Body.createFixture(fixtureDef.b2FixtureDef);
			//node.body.b2Body.setM();
		}
	}
	
}