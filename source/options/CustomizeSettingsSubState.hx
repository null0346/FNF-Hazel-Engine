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

class CustomizeSettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Customization';
		rpcTitle = 'Customization Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Watermark Style',
			'Watermark Style if ya want one.',
			'watermarkStyle',
			'string',
			'Hazel Engine',
			['None', 'Hazel Engine', 'Dave and Bambi', 'Strident Crisis', 'OS "Engine"']);
		addOption(option);

		var option:Option = new Option('Info Text',
			'Shows info such as Notes Per Second.\nThere will be more stuff for this soon.',
			'infoText',
			'string',
			'None',
			['None', 'Scroll Speed', 'BPM', 'Scroll Speed + BPM']);
		addOption(option);
	}
}