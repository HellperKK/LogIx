package;
using StringTools;

class CodeManager 
{
	//private var parsedCode:Array<TypeBase>;
	private var bruteCode:String;
	private var clearCode:String;
	private var lines:Array<String>;
	

	public function new(texte) 
	{
		bruteCode = texte;
		this.firstParse();
	}
	
	private function firstParse()
	{
		var liste = bruteCode.split("\n");
		var compteur = (liste.length -1);
		while (compteur > 0)
		{
			var x = liste[compteur];
			if (x.isSpace(0))
			{
				liste[compteur - 1] = liste[compteur - 1].rtrim() + " " + x.trim();
				liste.remove(x);
			}
			compteur -= 1;
		}
		lines = liste.map(function(x){return x.trim(); });
		clearCode = lines.join("\n");
	}
	
	private function secondParse()
	{
		
	}
	
	public function to_string()
	{
		return clearCode;
	}
}