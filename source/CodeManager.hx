package;
using StringTools;

class CodeManager 
{
	private var parsedCode:Array<TypeBase>;
	private var clearCode:String;
	

	public function new(texte) 
	{
		this.parseFirst(texte);
	}
	
	private function parseFirst(texte)
	{
		var liste = texte.split("\n");
		var compteur = liste.length -1;
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
		clearCode = liste.map(function(x){return x.trim(); }).join("\n");
	}
	
	public function to_string()
	{
		return clearCode;
	}
}