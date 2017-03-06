package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIList;
import flixel.addons.ui.FlxUIText;
import flixel.math.FlxMath;
import haxe.Serializer;

class SceneTerminal extends SceneBase 
{

	private var entry:FlxInputText;
	private var log:FlxUIList;
	private var compteur:Int;
	
	override public function new():Void
	{
		entry = new FlxInputText(0, 0, FlxG.width, this.arrow(), 20);
		entry.y = FlxG.height - entry.height;
		entry.filterMode = FlxInputText.ONLY_ALPHANUMERIC;
		log = new FlxUIList(0, 0, [], FlxG.width, FlxG.height - entry.height);
		compteur = 0;
		super();
	}

	override public function update(elapsed)
	{
		entry.update(elapsed);
		entry.hasFocus = true;
		var a = "";
		
		if (FlxG.keys.justPressed.ENTER)
		{
			a = entry.text;
			this.log_add(a);
			entry.text = "";
			selected = this.evaluate(a.substr(this.arrow().length));
		}
		else{
			selected = function(){};
		}
		
		//if (FlxG.keys.justPressed.SPACE)
		//{
			//var ser = new Serializer();
			//ser.serialize(1);
			//this.log_add(ser.toString());
		//}
		
		log.update(elapsed);
		this.entry_update();
		super.update(elapsed);
	}
	override public function draw()
	{
		entry.draw();
		log.draw();
		super.draw();
	}
	
	private function log_add(x)
	{
		log.add(new FlxUIText(0, 0, 0, x, 20));
		compteur += 1;
		if (compteur > this.log_size())
		{
			log.scrollIndex = compteur - this.log_size();
		}
	}
	
	private function entry_update()
	{
		if (entry.text.length < 3)
		{
			entry.text = "$->";
			entry.caretIndex = entry.text.length;
		}
	}
	
	private function log_size()
	{
		return 15;
	}
	
	private function arrow()
	{
		return "$->";
	}
	
	private function evaluate(instuction)
	{
		var retour = function(){};
		
		switch instuction
		{
			case "Coucou" : this.log_add("C'est bien coucou");
			case x : this.log_add('L\'instruction ${x} est inconnue');
		}
		
		return retour;
	}
	
	public function add_effect(x)
	{
		commands.push(x);
	}
}