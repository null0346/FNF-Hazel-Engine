package options;

import objects.Note;
import objects.StrumNote;
import objects.NoteSplash;
import objects.Alphabet;

class RenderingSubState extends BaseOptionsMenu
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

		var option:Option = new Option('Video Framerate',
		"How much FPS would you like for your videos?",
		'targetFPS',
		FLOAT);
		addOption(option);

		final refreshRate:Int = FlxG.stage.application.window.displayMode.refreshRate;
		option.minValue = 1;
		option.maxValue = 1000;
		option.scrollSpeed = 125;
		option.decimals = 0;
		option.defaultValue = Std.int(FlxMath.bound(refreshRate, option.minValue, option.maxValue));
		option.displayFormat = '%v FPS';


		var option:Option = new Option('Unlock Framerate', //Name
		'If checked, the framerate will be uncapped while rendering a song.\nNOTE: This does not affect the video framerate!',
		'unlockFPS',
		BOOL);
		addOption(option);

		super();
	}
}
