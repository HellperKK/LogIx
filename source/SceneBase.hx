package;

class SceneBase 
{
	private var commands:Array<Void->Void>;
	public var selected:Void->Void;

	public function new() 
	{
		commands = [];
		selected = function(){};
	}
	public function update(elapsed)
	{
		
	}
	public function draw()
	{
		
	}
}