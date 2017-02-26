#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;IniRead, OutputVar, Filename, Section, Key [, Default]

IniRead ImageFolder, AppLauncher_config.ini, General Settings, ImageFolder
ImageX = -283
ImageY = 12
LoopNumber = 30
CurrentIndex = 0
AppFilter = 

MainLoop:
{
	Loop, %LoopNumber%
	{
		CookedNumber := CurrentIndex + A_Index
		AppNumber = App %CookedNumber%
		gosub ReadValues
		if AppImage != ERROR
		{	
			ImageX+=310
			If (ImageX > 1800)
			{
				ImageX = 22
				ImageY+=205
			}
			App%CookedNumber%Command = %AppCommand%
			ProgImage = %ImageFolder%/%AppImage%
			GUI, Add, Picture, w300 h200 x%ImageX% y%ImageY% gApp%CookedNumber%Command, %ProgImage%
			TotalApps = %CookedNumber%: %AppName%, %TotalApps%
		}
		else
		break

	}
	;MsgBox, %TotalApps%
	;MsgBox, Commands after Loop: %App1Command%, %App2Command%, %App3Command% ...etc etc...
	gosub CreateGui
	return
}

PlatformLoop:
{
	Loop, %LoopNumber%
	{
		CookedNumber := CurrentIndex + A_Index
		AppNumber = App %CookedNumber%
		gosub ReadValues
		if AppImage != ERROR
		{	
			If AppPlatform = AppFilter
			{
				ImageX+=310
				If (ImageX > 1800)
				{
					ImageX = 22
					ImageY+=205
				}
				App%CookedNumber%Command = %AppCommand%
				ProgImage = %ImageFolder%/%AppImage%
				GUI, Add, Picture, w300 h200 x%ImageX% y%ImageY% gApp%CookedNumber%Command, %ProgImage%
				TotalApps = %CookedNumber%: %AppName%, %TotalApps%
			}
			else
			continue
		}
		else
		break

	}
	;MsgBox, %TotalApps%
	;MsgBox, Commands after Loop: %App1Command%, %App2Command%, %App3Command% ...etc etc...
	gosub CreateGui
	return
}

FavLoop:
{
	Loop, %LoopNumber%
	{
		CookedNumber := CurrentIndex + A_Index
		AppNumber = App %CookedNumber%
		gosub ReadValues
		if AppImage != ERROR
		{	
			If AppFavorite = yes
			{
				ImageX+=310
				If (ImageX > 1800)
				{
					ImageX = 22
					ImageY+=205
				}
				App%CookedNumber%Command = %AppCommand%
				ProgImage = %ImageFolder%/%AppImage%
				GUI, Add, Picture, w300 h200 x%ImageX% y%ImageY% gApp%CookedNumber%Command, %ProgImage%
				TotalApps = %CookedNumber%: %AppName%, %TotalApps%
			}
			else
			continue
		}
		else
		break

	}
	;MsgBox, %TotalApps%
	;MsgBox, Commands after Loop: %App1Command%, %App2Command%, %App3Command% ...etc etc...
	gosub CreateGui
	return
}

ReadValues:
IniRead AppName, AppLauncher_config.ini, %AppNumber%, name
IniRead AppImage, AppLauncher_config.ini, %AppNumber%, image
IniRead AppCommand, AppLauncher_config.ini, %AppNumber%, command
IniRead AppFavorite, AppLauncher_config.ini, %AppNumber%, favorite
IniRead AppPlatform, AppLauncher_config.ini, %AppNumber%, platform
;MsgBox %AppNumber% Name: %AppName%, Image: %AppImage%, Command: %AppCommand%, Image X = %ImageX%, Image Y = %ImageY%
return

CreateGui:
Gui, Add, Button, x1675 y1060 w200 h30 gNextPage, Next Page
	if (CookedNumber > LoopNumber)
	{
		Gui, Add, Button, x22 y1060 w200 h30 gPreviousPage, Previous Page
	}
	Gui, Add, Button, x1675 y1060 w200 h30 gNextPage, Next Page
	Gui, Add, Button, x300 y1060 w200 h30 gAppFavorites, favorites
	Gui, Add, Button, x500 y1060 w200 h30 gAppPc, pc
	Gui, Add, Button, x700 y1060 w200 h30 gAppC64, c64
	Gui, Show, x10 y10 h1100 w1900, AppLauncher
Return

NextPage:
Gui Destroy
CurrentIndex+=LoopNumber
ImageX = -283
ImageY = 12
GoSub, MainLoop
return

PreviousPage:
Gui Destroy
CurrentIndex-=LoopNumber
ImageX = -283
ImageY = 12
GoSub, MainLoop
return


AppPc:
Gui Destroy
AppFilter = pc
AppFav = no
ImageX = -283
ImageY = 12
GoSub, PlatformLoop
return

Appc64:
Gui Destroy
AppFilter = c64
AppFav = no
ImageX = -283
ImageY = 12
GoSub, PlatformLoop
return

AppFavorites:
Gui Destroy
AppFilter = 
AppFav = yes
ImageX = -283
ImageY = 12
GoSub, FavLoop
return



GuiClose:
ExitApp


GoSub, MainLoop


App1Command:
Run, %App1Command%
ExitApp
return

App2Command:
Run, %App2Command%
ExitApp
return

App3Command:
Run, %App3Command%
ExitApp
return

App4Command:
Run, %App4Command%
ExitApp
return

App5Command:
Run, %App5Command%
ExitApp
return

App6Command:
Run, %App6Command%
ExitApp
return

App7Command:
Run, %App7Command%
ExitApp
return

App8Command:
Run, %App8Command%
ExitApp
return

App9Command:
Run, %App9Command%
ExitApp
return

App10Command:
Run, %App10Command%
ExitApp
return

App11Command:
Run, %App11Command%
ExitApp
return

App12Command:
Run, %App12Command%
ExitApp
return

App13Command:
Run, %App13Command%
ExitApp
return

App14Command:
Run, %App14Command%
ExitApp
return

App15Command:
Run, %App15Command%
ExitApp
return

App16Command:
Run, %App16Command%
ExitApp
return

App17Command:
Run, %App17Command%
ExitApp
return

App18Command:
Run, %App18Command%
ExitApp
return

App19Command:
Run, %App19Command%
ExitApp
return

App20Command:
Run, %App20Command%
ExitApp
return

App21Command:
Run, %App21Command%
ExitApp
return

App22Command:
Run, %App22Command%
ExitApp
return

App23Command:
Run, %App23Command%
ExitApp
return

App24Command:
Run, %App24Command%
ExitApp
return

App25Command:
Run, %App25Command%
ExitApp
return

App26Command:
Run, %App26Command%
ExitApp
return

App27Command:
Run, %App27Command%
ExitApp
return

App28Command:
Run, %App28Command%
ExitApp
return

App29Command:
Run, %App29Command%
ExitApp
return

App30Command:
Run, %App30Command%
ExitApp
return

App31Command:
Run, %App31Command%
ExitApp
return

App32Command:
Run, %App32Command%
ExitApp
return

App33Command:
Run, %App33Command%
ExitApp
return

App34Command:
Run, %App34Command%
ExitApp
return

App35Command:
Run, %App35Command%
ExitApp
return

App36Command:
Run, %App36Command%
ExitApp
return

App37Command:
Run, %App37Command%
ExitApp
return

App38Command:
Run, %App38Command%
ExitApp
return

App39Command:
Run, %App39Command%
ExitApp
return

App40Command:
Run, %App40Command%
ExitApp
return

App41Command:
Run, %App41Command%
ExitApp
return

App42Command:
Run, %App42Command%
ExitApp
return

App43Command:
Run, %App43Command%
ExitApp
return

App44Command:
Run, %App44Command%
ExitApp
return

App45Command:
Run, %App45Command%
ExitApp
return

App46Command:
Run, %App46Command%
ExitApp
return

App47Command:
Run, %App47Command%
ExitApp
return

App48Command:
Run, %App48Command%
ExitApp
return

App49Command:
Run, %App49Command%
ExitApp
return

App50Command:
Run, %App50Command%
ExitApp
return

App51Command:
Run, %App51Command%
ExitApp
return

App52Command:
Run, %App52Command%
ExitApp
return

App53Command:
Run, %App53Command%
ExitApp
return

App54Command:
Run, %App54Command%
ExitApp
return

App55Command:
Run, %App55Command%
ExitApp
return

App56Command:
Run, %App56Command%
ExitApp
return

App57Command:
Run, %App57Command%
ExitApp
return

App58Command:
Run, %App58Command%
ExitApp
return

App59Command:
Run, %App59Command%
ExitApp
return

App60Command:
Run, %App60Command%
ExitApp
return

App61Command:
Run, %App61Command%
ExitApp
return

App62Command:
Run, %App62Command%
ExitApp
return

App63Command:
Run, %App63Command%
ExitApp
return

App64Command:
Run, %App64Command%
ExitApp
return

App65Command:
Run, %App65Command%
ExitApp
return

App66Command:
Run, %App66Command%
ExitApp
return

App67Command:
Run, %App67Command%
ExitApp
return

App68Command:
Run, %App68Command%
ExitApp
return

App69Command:
Run, %App69Command%
ExitApp
return

App70Command:
Run, %App70Command%
ExitApp
return

App71Command:
Run, %App71Command%
ExitApp
return

App72Command:
Run, %App72Command%
ExitApp
return

App73Command:
Run, %App73Command%
ExitApp
return

App74Command:
Run, %App74Command%
ExitApp
return

App75Command:
Run, %App75Command%
ExitApp
return

App76Command:
Run, %App76Command%
ExitApp
return

App77Command:
Run, %App77Command%
ExitApp
return

App78Command:
Run, %App78Command%
ExitApp
return

App79Command:
Run, %App79Command%
ExitApp
return

App80Command:
Run, %App80Command%
ExitApp
return

App81Command:
Run, %App81Command%
ExitApp
return

App82Command:
Run, %App82Command%
ExitApp
return

App83Command:
Run, %App83Command%
ExitApp
return

App84Command:
Run, %App84Command%
ExitApp
return

App85Command:
Run, %App85Command%
ExitApp
return

App86Command:
Run, %App86Command%
ExitApp
return

App87Command:
Run, %App87Command%
ExitApp
return

App88Command:
Run, %App88Command%
ExitApp
return

App89Command:
Run, %App89Command%
ExitApp
return

App90Command:
Run, %App90Command%
ExitApp
return

App91Command:
Run, %App91Command%
ExitApp
return

App92Command:
Run, %App92Command%
ExitApp
return

App93Command:
Run, %App93Command%
ExitApp
return

App94Command:
Run, %App94Command%
ExitApp
return

App95Command:
Run, %App95Command%
ExitApp
return

App96Command:
Run, %App96Command%
ExitApp
return

App97Command:
Run, %App97Command%
ExitApp
return

App98Command:
Run, %App98Command%
ExitApp
return

App99Command:
Run, %App99Command%
ExitApp
return

App100Command:
Run, %App100Command%
ExitApp
return

App101Command:
Run, %App101Command%
ExitApp
return

App102Command:
Run, %App102Command%
ExitApp
return

App103Command:
Run, %App103Command%
ExitApp
return

App104Command:
Run, %App104Command%
ExitApp
return

App105Command:
Run, %App105Command%
ExitApp
return

App106Command:
Run, %App106Command%
ExitApp
return

App107Command:
Run, %App107Command%
ExitApp
return

App108Command:
Run, %App108Command%
ExitApp
return

App109Command:
Run, %App109Command%
ExitApp
return

App110Command:
Run, %App110Command%
ExitApp
return

App111Command:
Run, %App111Command%
ExitApp
return

App112Command:
Run, %App112Command%
ExitApp
return

App113Command:
Run, %App113Command%
ExitApp
return

App114Command:
Run, %App114Command%
ExitApp
return

App115Command:
Run, %App115Command%
ExitApp
return

App116Command:
Run, %App116Command%
ExitApp
return

App117Command:
Run, %App117Command%
ExitApp
return

App118Command:
Run, %App118Command%
ExitApp
return

App119Command:
Run, %App119Command%
ExitApp
return

App120Command:
Run, %App120Command%
ExitApp
return

App121Command:
Run, %App121Command%
ExitApp
return

App122Command:
Run, %App122Command%
ExitApp
return

App123Command:
Run, %App123Command%
ExitApp
return

App124Command:
Run, %App124Command%
ExitApp
return

App125Command:
Run, %App125Command%
ExitApp
return

App126Command:
Run, %App126Command%
ExitApp
return

App127Command:
Run, %App127Command%
ExitApp
return

App128Command:
Run, %App128Command%
ExitApp
return

App129Command:
Run, %App129Command%
ExitApp
return

App130Command:
Run, %App130Command%
ExitApp
return

App131Command:
Run, %App131Command%
ExitApp
return

App132Command:
Run, %App132Command%
ExitApp
return

App133Command:
Run, %App133Command%
ExitApp
return

App134Command:
Run, %App134Command%
ExitApp
return

App135Command:
Run, %App135Command%
ExitApp
return

App136Command:
Run, %App136Command%
ExitApp
return

App137Command:
Run, %App137Command%
ExitApp
return

App138Command:
Run, %App138Command%
ExitApp
return

App139Command:
Run, %App139Command%
ExitApp
return

App140Command:
Run, %App140Command%
ExitApp
return

App141Command:
Run, %App141Command%
ExitApp
return

App142Command:
Run, %App142Command%
ExitApp
return

App143Command:
Run, %App143Command%
ExitApp
return

App144Command:
Run, %App144Command%
ExitApp
return

App145Command:
Run, %App145Command%
ExitApp
return

App146Command:
Run, %App146Command%
ExitApp
return

App147Command:
Run, %App147Command%
ExitApp
return

App148Command:
Run, %App148Command%
ExitApp
return

App149Command:
Run, %App149Command%
ExitApp
return

App150Command:
Run, %App150Command%
ExitApp
return

App151Command:
Run, %App151Command%
ExitApp
return

App152Command:
Run, %App152Command%
ExitApp
return

App153Command:
Run, %App153Command%
ExitApp
return

App154Command:
Run, %App154Command%
ExitApp
return

App155Command:
Run, %App155Command%
ExitApp
return

App156Command:
Run, %App156Command%
ExitApp
return

App157Command:
Run, %App157Command%
ExitApp
return

App158Command:
Run, %App158Command%
ExitApp
return

App159Command:
Run, %App159Command%
ExitApp
return

App160Command:
Run, %App160Command%
ExitApp
return

App161Command:
Run, %App161Command%
ExitApp
return

App162Command:
Run, %App162Command%
ExitApp
return

App163Command:
Run, %App163Command%
ExitApp
return

App164Command:
Run, %App164Command%
ExitApp
return

App165Command:
Run, %App165Command%
ExitApp
return

App166Command:
Run, %App166Command%
ExitApp
return

App167Command:
Run, %App167Command%
ExitApp
return

App168Command:
Run, %App168Command%
ExitApp
return

App169Command:
Run, %App169Command%
ExitApp
return

App170Command:
Run, %App170Command%
ExitApp
return

App171Command:
Run, %App171Command%
ExitApp
return

App172Command:
Run, %App172Command%
ExitApp
return

App173Command:
Run, %App173Command%
ExitApp
return

App174Command:
Run, %App174Command%
ExitApp
return

App175Command:
Run, %App175Command%
ExitApp
return

App176Command:
Run, %App176Command%
ExitApp
return

App177Command:
Run, %App177Command%
ExitApp
return

App178Command:
Run, %App178Command%
ExitApp
return

App179Command:
Run, %App179Command%
ExitApp
return

App180Command:
Run, %App180Command%
ExitApp
return

App181Command:
Run, %App181Command%
ExitApp
return

App182Command:
Run, %App182Command%
ExitApp
return

App183Command:
Run, %App183Command%
ExitApp
return

App184Command:
Run, %App184Command%
ExitApp
return

App185Command:
Run, %App185Command%
ExitApp
return

App186Command:
Run, %App186Command%
ExitApp
return

App187Command:
Run, %App187Command%
ExitApp
return

App188Command:
Run, %App188Command%
ExitApp
return

App189Command:
Run, %App189Command%
ExitApp
return

App190Command:
Run, %App190Command%
ExitApp
return

App191Command:
Run, %App191Command%
ExitApp
return

App192Command:
Run, %App192Command%
ExitApp
return

App193Command:
Run, %App193Command%
ExitApp
return

App194Command:
Run, %App194Command%
ExitApp
return

App195Command:
Run, %App195Command%
ExitApp
return

App196Command:
Run, %App196Command%
ExitApp
return

App197Command:
Run, %App197Command%
ExitApp
return

App198Command:
Run, %App198Command%
ExitApp
return

App199Command:
Run, %App199Command%
ExitApp
return

App200Command:
Run, %App200Command%
ExitApp
return

App201Command:
Run, %App201Command%
ExitApp
return

App202Command:
Run, %App202Command%
ExitApp
return

App203Command:
Run, %App203Command%
ExitApp
return

App204Command:
Run, %App204Command%
ExitApp
return

App205Command:
Run, %App205Command%
ExitApp
return

App206Command:
Run, %App206Command%
ExitApp
return

App207Command:
Run, %App207Command%
ExitApp
return

App208Command:
Run, %App208Command%
ExitApp
return

App209Command:
Run, %App209Command%
ExitApp
return

App210Command:
Run, %App210Command%
ExitApp
return

App211Command:
Run, %App211Command%
ExitApp
return

App212Command:
Run, %App212Command%
ExitApp
return

App213Command:
Run, %App213Command%
ExitApp
return

App214Command:
Run, %App214Command%
ExitApp
return

App215Command:
Run, %App215Command%
ExitApp
return

App216Command:
Run, %App216Command%
ExitApp
return

App217Command:
Run, %App217Command%
ExitApp
return

App218Command:
Run, %App218Command%
ExitApp
return

App219Command:
Run, %App219Command%
ExitApp
return

App220Command:
Run, %App220Command%
ExitApp
return

App221Command:
Run, %App221Command%
ExitApp
return

App222Command:
Run, %App222Command%
ExitApp
return

App223Command:
Run, %App223Command%
ExitApp
return

App224Command:
Run, %App224Command%
ExitApp
return

App225Command:
Run, %App225Command%
ExitApp
return

App226Command:
Run, %App226Command%
ExitApp
return

App227Command:
Run, %App227Command%
ExitApp
return

App228Command:
Run, %App228Command%
ExitApp
return

App229Command:
Run, %App229Command%
ExitApp
return

App230Command:
Run, %App230Command%
ExitApp
return

App231Command:
Run, %App231Command%
ExitApp
return

App232Command:
Run, %App232Command%
ExitApp
return

App233Command:
Run, %App233Command%
ExitApp
return

App234Command:
Run, %App234Command%
ExitApp
return

App235Command:
Run, %App235Command%
ExitApp
return

App236Command:
Run, %App236Command%
ExitApp
return

App237Command:
Run, %App237Command%
ExitApp
return

App238Command:
Run, %App238Command%
ExitApp
return

App239Command:
Run, %App239Command%
ExitApp
return

App240Command:
Run, %App240Command%
ExitApp
return

App241Command:
Run, %App241Command%
ExitApp
return

App242Command:
Run, %App242Command%
ExitApp
return

App243Command:
Run, %App243Command%
ExitApp
return

App244Command:
Run, %App244Command%
ExitApp
return

App245Command:
Run, %App245Command%
ExitApp
return

App246Command:
Run, %App246Command%
ExitApp
return

App247Command:
Run, %App247Command%
ExitApp
return

App248Command:
Run, %App248Command%
ExitApp
return

App249Command:
Run, %App249Command%
ExitApp
return

App250Command:
Run, %App250Command%
ExitApp
return

App251Command:
Run, %App251Command%
ExitApp
return

App252Command:
Run, %App252Command%
ExitApp
return

App253Command:
Run, %App253Command%
ExitApp
return

App254Command:
Run, %App254Command%
ExitApp
return

App255Command:
Run, %App255Command%
ExitApp
return

App256Command:
Run, %App256Command%
ExitApp
return

App257Command:
Run, %App257Command%
ExitApp
return

App258Command:
Run, %App258Command%
ExitApp
return

App259Command:
Run, %App259Command%
ExitApp
return

App260Command:
Run, %App260Command%
ExitApp
return

App261Command:
Run, %App261Command%
ExitApp
return

App262Command:
Run, %App262Command%
ExitApp
return

App263Command:
Run, %App263Command%
ExitApp
return

App264Command:
Run, %App264Command%
ExitApp
return

App265Command:
Run, %App265Command%
ExitApp
return

App266Command:
Run, %App266Command%
ExitApp
return

App267Command:
Run, %App267Command%
ExitApp
return

App268Command:
Run, %App268Command%
ExitApp
return

App269Command:
Run, %App269Command%
ExitApp
return

App270Command:
Run, %App270Command%
ExitApp
return

App271Command:
Run, %App271Command%
ExitApp
return

App272Command:
Run, %App272Command%
ExitApp
return

App273Command:
Run, %App273Command%
ExitApp
return

App274Command:
Run, %App274Command%
ExitApp
return

App275Command:
Run, %App275Command%
ExitApp
return

App276Command:
Run, %App276Command%
ExitApp
return

App277Command:
Run, %App277Command%
ExitApp
return

App278Command:
Run, %App278Command%
ExitApp
return

App279Command:
Run, %App279Command%
ExitApp
return

App280Command:
Run, %App280Command%
ExitApp
return

App281Command:
Run, %App281Command%
ExitApp
return

App282Command:
Run, %App282Command%
ExitApp
return

App283Command:
Run, %App283Command%
ExitApp
return

App284Command:
Run, %App284Command%
ExitApp
return

App285Command:
Run, %App285Command%
ExitApp
return

App286Command:
Run, %App286Command%
ExitApp
return

App287Command:
Run, %App287Command%
ExitApp
return

App288Command:
Run, %App288Command%
ExitApp
return

App289Command:
Run, %App289Command%
ExitApp
return

App290Command:
Run, %App290Command%
ExitApp
return

App291Command:
Run, %App291Command%
ExitApp
return

App292Command:
Run, %App292Command%
ExitApp
return

App293Command:
Run, %App293Command%
ExitApp
return

App294Command:
Run, %App294Command%
ExitApp
return

App295Command:
Run, %App295Command%
ExitApp
return

App296Command:
Run, %App296Command%
ExitApp
return

App297Command:
Run, %App297Command%
ExitApp
return

App298Command:
Run, %App298Command%
ExitApp
return

App299Command:
Run, %App299Command%
ExitApp
return

App300Command:
Run, %App300Command%
ExitApp
return

App301Command:
Run, %App301Command%
ExitApp
return

App302Command:
Run, %App302Command%
ExitApp
return

App303Command:
Run, %App303Command%
ExitApp
return

App304Command:
Run, %App304Command%
ExitApp
return

App305Command:
Run, %App305Command%
ExitApp
return

App306Command:
Run, %App306Command%
ExitApp
return

App307Command:
Run, %App307Command%
ExitApp
return

App308Command:
Run, %App308Command%
ExitApp
return

App309Command:
Run, %App309Command%
ExitApp
return

App310Command:
Run, %App310Command%
ExitApp
return

App311Command:
Run, %App311Command%
ExitApp
return

App312Command:
Run, %App312Command%
ExitApp
return

App313Command:
Run, %App313Command%
ExitApp
return

App314Command:
Run, %App314Command%
ExitApp
return

App315Command:
Run, %App315Command%
ExitApp
return

App316Command:
Run, %App316Command%
ExitApp
return

App317Command:
Run, %App317Command%
ExitApp
return

App318Command:
Run, %App318Command%
ExitApp
return

App319Command:
Run, %App319Command%
ExitApp
return

App320Command:
Run, %App320Command%
ExitApp
return

App321Command:
Run, %App321Command%
ExitApp
return

App322Command:
Run, %App322Command%
ExitApp
return

App323Command:
Run, %App323Command%
ExitApp
return

App324Command:
Run, %App324Command%
ExitApp
return

App325Command:
Run, %App325Command%
ExitApp
return

App326Command:
Run, %App326Command%
ExitApp
return

App327Command:
Run, %App327Command%
ExitApp
return

App328Command:
Run, %App328Command%
ExitApp
return

App329Command:
Run, %App329Command%
ExitApp
return

App330Command:
Run, %App330Command%
ExitApp
return

App331Command:
Run, %App331Command%
ExitApp
return

App332Command:
Run, %App332Command%
ExitApp
return

App333Command:
Run, %App333Command%
ExitApp
return

App334Command:
Run, %App334Command%
ExitApp
return

App335Command:
Run, %App335Command%
ExitApp
return

App336Command:
Run, %App336Command%
ExitApp
return

App337Command:
Run, %App337Command%
ExitApp
return

App338Command:
Run, %App338Command%
ExitApp
return

App339Command:
Run, %App339Command%
ExitApp
return

App340Command:
Run, %App340Command%
ExitApp
return

App341Command:
Run, %App341Command%
ExitApp
return

App342Command:
Run, %App342Command%
ExitApp
return

App343Command:
Run, %App343Command%
ExitApp
return

App344Command:
Run, %App344Command%
ExitApp
return

App345Command:
Run, %App345Command%
ExitApp
return

App346Command:
Run, %App346Command%
ExitApp
return

App347Command:
Run, %App347Command%
ExitApp
return

App348Command:
Run, %App348Command%
ExitApp
return

App349Command:
Run, %App349Command%
ExitApp
return

App350Command:
Run, %App350Command%
ExitApp
return

App351Command:
Run, %App351Command%
ExitApp
return

App352Command:
Run, %App352Command%
ExitApp
return

App353Command:
Run, %App353Command%
ExitApp
return

App354Command:
Run, %App354Command%
ExitApp
return

App355Command:
Run, %App355Command%
ExitApp
return

App356Command:
Run, %App356Command%
ExitApp
return

App357Command:
Run, %App357Command%
ExitApp
return

App358Command:
Run, %App358Command%
ExitApp
return

App359Command:
Run, %App359Command%
ExitApp
return

App360Command:
Run, %App360Command%
ExitApp
return

App361Command:
Run, %App361Command%
ExitApp
return

App362Command:
Run, %App362Command%
ExitApp
return

App363Command:
Run, %App363Command%
ExitApp
return

App364Command:
Run, %App364Command%
ExitApp
return

App365Command:
Run, %App365Command%
ExitApp
return

App366Command:
Run, %App366Command%
ExitApp
return

App367Command:
Run, %App367Command%
ExitApp
return

App368Command:
Run, %App368Command%
ExitApp
return

App369Command:
Run, %App369Command%
ExitApp
return

App370Command:
Run, %App370Command%
ExitApp
return

App371Command:
Run, %App371Command%
ExitApp
return

App372Command:
Run, %App372Command%
ExitApp
return

App373Command:
Run, %App373Command%
ExitApp
return

App374Command:
Run, %App374Command%
ExitApp
return

App375Command:
Run, %App375Command%
ExitApp
return

App376Command:
Run, %App376Command%
ExitApp
return

App377Command:
Run, %App377Command%
ExitApp
return

App378Command:
Run, %App378Command%
ExitApp
return

App379Command:
Run, %App379Command%
ExitApp
return

App380Command:
Run, %App380Command%
ExitApp
return

App381Command:
Run, %App381Command%
ExitApp
return

App382Command:
Run, %App382Command%
ExitApp
return

App383Command:
Run, %App383Command%
ExitApp
return

App384Command:
Run, %App384Command%
ExitApp
return

App385Command:
Run, %App385Command%
ExitApp
return

App386Command:
Run, %App386Command%
ExitApp
return

App387Command:
Run, %App387Command%
ExitApp
return

App388Command:
Run, %App388Command%
ExitApp
return

App389Command:
Run, %App389Command%
ExitApp
return

App390Command:
Run, %App390Command%
ExitApp
return

App391Command:
Run, %App391Command%
ExitApp
return

App392Command:
Run, %App392Command%
ExitApp
return

App393Command:
Run, %App393Command%
ExitApp
return

App394Command:
Run, %App394Command%
ExitApp
return

App395Command:
Run, %App395Command%
ExitApp
return

App396Command:
Run, %App396Command%
ExitApp
return

App397Command:
Run, %App397Command%
ExitApp
return

App398Command:
Run, %App398Command%
ExitApp
return

App399Command:
Run, %App399Command%
ExitApp
return

App400Command:
Run, %App400Command%
ExitApp
return

App401Command:
Run, %App401Command%
ExitApp
return

App402Command:
Run, %App402Command%
ExitApp
return

App403Command:
Run, %App403Command%
ExitApp
return

App404Command:
Run, %App404Command%
ExitApp
return

App405Command:
Run, %App405Command%
ExitApp
return

App406Command:
Run, %App406Command%
ExitApp
return

App407Command:
Run, %App407Command%
ExitApp
return

App408Command:
Run, %App408Command%
ExitApp
return

App409Command:
Run, %App409Command%
ExitApp
return

App410Command:
Run, %App410Command%
ExitApp
return

App411Command:
Run, %App411Command%
ExitApp
return

App412Command:
Run, %App412Command%
ExitApp
return

App413Command:
Run, %App413Command%
ExitApp
return

App414Command:
Run, %App414Command%
ExitApp
return

App415Command:
Run, %App415Command%
ExitApp
return

App416Command:
Run, %App416Command%
ExitApp
return

App417Command:
Run, %App417Command%
ExitApp
return

App418Command:
Run, %App418Command%
ExitApp
return

App419Command:
Run, %App419Command%
ExitApp
return

App420Command:
Run, %App420Command%
ExitApp
return

App421Command:
Run, %App421Command%
ExitApp
return

App422Command:
Run, %App422Command%
ExitApp
return

App423Command:
Run, %App423Command%
ExitApp
return

App424Command:
Run, %App424Command%
ExitApp
return

App425Command:
Run, %App425Command%
ExitApp
return

App426Command:
Run, %App426Command%
ExitApp
return

App427Command:
Run, %App427Command%
ExitApp
return

App428Command:
Run, %App428Command%
ExitApp
return

App429Command:
Run, %App429Command%
ExitApp
return

App430Command:
Run, %App430Command%
ExitApp
return

App431Command:
Run, %App431Command%
ExitApp
return

App432Command:
Run, %App432Command%
ExitApp
return

App433Command:
Run, %App433Command%
ExitApp
return

App434Command:
Run, %App434Command%
ExitApp
return

App435Command:
Run, %App435Command%
ExitApp
return

App436Command:
Run, %App436Command%
ExitApp
return

App437Command:
Run, %App437Command%
ExitApp
return

App438Command:
Run, %App438Command%
ExitApp
return

App439Command:
Run, %App439Command%
ExitApp
return

App440Command:
Run, %App440Command%
ExitApp
return

App441Command:
Run, %App441Command%
ExitApp
return

App442Command:
Run, %App442Command%
ExitApp
return

App443Command:
Run, %App443Command%
ExitApp
return

App444Command:
Run, %App444Command%
ExitApp
return

App445Command:
Run, %App445Command%
ExitApp
return

App446Command:
Run, %App446Command%
ExitApp
return

App447Command:
Run, %App447Command%
ExitApp
return

App448Command:
Run, %App448Command%
ExitApp
return

App449Command:
Run, %App449Command%
ExitApp
return

App450Command:
Run, %App450Command%
ExitApp
return

App451Command:
Run, %App451Command%
ExitApp
return

App452Command:
Run, %App452Command%
ExitApp
return

App453Command:
Run, %App453Command%
ExitApp
return

App454Command:
Run, %App454Command%
ExitApp
return

App455Command:
Run, %App455Command%
ExitApp
return

App456Command:
Run, %App456Command%
ExitApp
return

App457Command:
Run, %App457Command%
ExitApp
return

App458Command:
Run, %App458Command%
ExitApp
return

App459Command:
Run, %App459Command%
ExitApp
return

App460Command:
Run, %App460Command%
ExitApp
return

App461Command:
Run, %App461Command%
ExitApp
return

App462Command:
Run, %App462Command%
ExitApp
return

App463Command:
Run, %App463Command%
ExitApp
return

App464Command:
Run, %App464Command%
ExitApp
return

App465Command:
Run, %App465Command%
ExitApp
return

App466Command:
Run, %App466Command%
ExitApp
return

App467Command:
Run, %App467Command%
ExitApp
return

App468Command:
Run, %App468Command%
ExitApp
return

App469Command:
Run, %App469Command%
ExitApp
return

App470Command:
Run, %App470Command%
ExitApp
return

App471Command:
Run, %App471Command%
ExitApp
return

App472Command:
Run, %App472Command%
ExitApp
return

App473Command:
Run, %App473Command%
ExitApp
return

App474Command:
Run, %App474Command%
ExitApp
return

App475Command:
Run, %App475Command%
ExitApp
return

App476Command:
Run, %App476Command%
ExitApp
return

App477Command:
Run, %App477Command%
ExitApp
return

App478Command:
Run, %App478Command%
ExitApp
return

App479Command:
Run, %App479Command%
ExitApp
return

App480Command:
Run, %App480Command%
ExitApp
return

App481Command:
Run, %App481Command%
ExitApp
return

App482Command:
Run, %App482Command%
ExitApp
return

App483Command:
Run, %App483Command%
ExitApp
return

App484Command:
Run, %App484Command%
ExitApp
return

App485Command:
Run, %App485Command%
ExitApp
return

App486Command:
Run, %App486Command%
ExitApp
return

App487Command:
Run, %App487Command%
ExitApp
return

App488Command:
Run, %App488Command%
ExitApp
return

App489Command:
Run, %App489Command%
ExitApp
return

App490Command:
Run, %App490Command%
ExitApp
return

App491Command:
Run, %App491Command%
ExitApp
return

App492Command:
Run, %App492Command%
ExitApp
return

App493Command:
Run, %App493Command%
ExitApp
return

App494Command:
Run, %App494Command%
ExitApp
return

App495Command:
Run, %App495Command%
ExitApp
return

App496Command:
Run, %App496Command%
ExitApp
return

App497Command:
Run, %App497Command%
ExitApp
return

App498Command:
Run, %App498Command%
ExitApp
return

App499Command:
Run, %App499Command%
ExitApp
return