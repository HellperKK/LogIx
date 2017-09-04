package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import sys.io.File;

class PlayState extends FlxState
{
	private var code:CodeManager;
	
	override public function create():Void
	{
		var x = File.getContent("assets/code/Main.txt");
		code = new CodeManager(x);
		File.saveContent("assets/code/Parsed.txt", code.to_string());
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	override public function draw()
	{
		
	}
	
	public static function init()
	{
		
	}
	
}
