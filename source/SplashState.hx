package;

import flixel.input.keyboard.FlxKey;

#if VIDEOS_ALLOWED
#if (hxCodec >= "3.0.0" || hxCodec == "git")
import hxcodec.flixel.FlxVideo as MP4Handler;
#elseif (hxCodec == "2.6.1")
import hxcodec.VideoHandler as MP4Handler;
#elseif (hxCodec == "2.6.0")
import VideoHandler as MP4Handler;
#else
import vlc.MP4Handler;
#end
#end

class SplashState extends MusicBeatState {
    var skipTxt:FlxText;
    override public function create():Void {
        skipTxt = new FlxText(0, FlxG.height, 0, 'Press ENTER To Skip', 16);
		skipTxt.setFormat("VCR OSD Mono", 18, FlxColor.WHITE, LEFT, OUTLINE, FlxColor.BLACK);
		skipTxt.borderSize = 1.5;
		skipTxt.antialiasing = true;
		skipTxt.scrollFactor.set();
		skipTxt.alpha = 0;
		skipTxt.y -= skipTxt.textField.textHeight;
		add(skipTxt);
    }

    function thefuckingintro(){ 
        #if VIDEOS_ALLOWED
					var vidSprite = new MP4Handler();
					#if (hxCodec < "3.0.0")
					vidSprite.playVideo(Paths.video('hl2Startup'), false, false);
					vidSprite.finishCallback = function()
					{
						try { vidSprite.dispose(); }
						catch (e) {}
						FlxG.switchState(TitleState.new);
					};
					#else
					vidSprite.play(Paths.video('hl2Startup'));
					vidSprite.onEndReached.add(function(){
						vidSprite.dispose();
						FlxG.switchState(TitleState.new);
					});
					#end
				#end
    }
    override function update(elapsed:Float)
        {
            if (FlxG.keys.justPressed.ENTER) FlxG.switchState(TitleState.new);
            super.update(elapsed);
        }
}