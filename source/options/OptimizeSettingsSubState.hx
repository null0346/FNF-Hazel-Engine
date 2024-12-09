package options;

import objects.Note;
import objects.StrumNote;
import objects.NoteSplash;
import objects.Alphabet;

class OptimizeSettingsSubState extends BaseOptionsMenu
{
	var noteOptionID:Int = -1;
	var notes:FlxTypedGroup<StrumNote>;
	var splashes:FlxTypedGroup<NoteSplash>;
	var noteY:Float = 90;
	public function new()
	{
		title = Language.getPhrase('optimize_menu', 'Optimizations Settings');
		rpcTitle = 'Optimizations Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Enable GC', //Name
			'If checked, the game will be able to garbage collect.\n This reduces RAM usage I think.', //Description
			'enableGC', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		super();
	}
}
