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
		title = Language.getPhrase('rendering_menu', 'Rendering Settings');
		rpcTitle = 'Rendering Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Enable Rendering Mode', //Name
			'If checked, the game will be able to render songs,\n making it easier to showcase big charts', //Description
			'ffmpegMode', //Save data variable name
			BOOL); //Variable type
		addOption(option);

		super();
	}
}
