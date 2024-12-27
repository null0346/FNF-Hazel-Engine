package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;
import openfl.Lib;

using StringTools;

class GraphicsSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Rendering';
		rpcTitle = 'Rendering Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('WORK IN PROGRESS',
			"Some things might cause crashes.\nMake changes at your own risk.",
			'openDoor',
			'string',
			['!']);
		addOption(option);

		var option:Option = new Option('Rendering Mode', //Name
			'If checked, the game can render songs,\n making it easier to showcase Bambi Spamtracks.', //Description
			'ffmpegMode', //Save data variable name
			'bool', //Variable type
			false); //Default value
		addOption(option);

		var option:Option = new Option('Rendering Framerate', //Name
			'What framerate do you want your renders to have?', //Description
			'targetFPS', //Save data variable name
			'float', //Variable type
			60); //Default value
		addOption(option);

		var option:Option = new Option('Unlock Framerate', //Name
			'If checked, the framerate will be uncapped while rendering a song.\nNOTE: This does not affect the video framerate!',
			'unlockFPS',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Video Bitrate: ',
			"Use this option to set your video's bitrate!",
			'renderBitrate',
			'float',
			5.00);
		addOption(option);

		option.minValue = 1.0;
		option.maxValue = 100.0;
		option.scrollSpeed = 5;
		option.changeValue = 0.01;
		option.decimals = 2;
		option.displayFormat = '%v Mbps';

		var option:Option = new Option('Video Encoder: ',
			"Which video encoder would you like?\nThey all have differences like rendering speed, quality, etc.",
			'vidEncoder',
			'string',
			'libx264',
			['libx264', 'libx264rgb', 'libx265', 'libxvid', 'libsvtav1', 'mpeg2video']);
		addOption(option);
	}
}