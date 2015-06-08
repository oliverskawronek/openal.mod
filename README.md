# OpenAL for BlitzMax
Makes OpenAL available for BlitzMax. AL, ALC, ALUT and EFX are part of the mod. Windows and Linux are supported.

> **Note**: This project was started in 2007 and last updated in 2008. It is currently not under active development!

Please read the [OpenAL 1.1 Spefication](http://www.openal.org/documentation/openal-1.1-specification.pdf). You can get the OpenAL installer from [here](http://www.openal.org/creative-installers/).

# Installation
1. Copy **vertex.mod** into your `%BlitzMax%/mod` folder
2. Make sure you have setup MinGW for BlitzMax correctly. Please check this topics:
 * [Guide how to set up MinGW for BlitzMax](http://www.blitzbasic.com/Community/posts.php?topic=90964)
 * [Installed MingW, can no longer build project](http://www.blitzbasic.com/Community/posts.php?topic=104435)
3. Open the MaxIDE, goto **Program** > **Build Modules**
4. Make sure you have OpenAL installed
5. Now you can import OpenAL by typing `import vertex.openal`

> **Note:** On Windows you have to ship your application with **OpenAL32.dll** and **wrap_oal.dll**.
Consider OpenAL's license before.

# Screenshot
Screenshot taken from the *example/capture-audio.bmx* example. It shows the captured wavefrom and the intensity calculated by root mean sqaure.
![screenshot](https://cloud.githubusercontent.com/assets/10528519/8035838/fbc8605c-0df3-11e5-9a89-d019a4ad2fe6.png "Screenshot taken from the capture-audio.bmx example")

# Example
This example list all available capture devices. See the **example** folder for more examples.
```blitzmax
SuperStrict

Framework brl.blitz
Import vertex.openal

TOpenAL.Open()
TOpenAL.InitAL()
TOpenAL.InitALC()

Global Device  : Byte Ptr, ..
       Context : Byte Ptr

Device = alcOpenDevice(Null)
Context = alcCreateContext(Device, Null)
alcMakeContextCurrent(Context)

WriteStdout("List of capture devices:~n")
For Local CaptureDevice:String = EachIn EnumCaptureDevices()
	WriteStdout(CaptureDevice + "~n")
Next
WriteStdout("#Default: " + String.FromCString(..
		alcGetString(Null, ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER)))

alcMakeContextCurrent(Null)
alcDestroyContext(Context)
alcCloseDevice(Device)

TOpenAL.Close()
End

Function EnumCaptureDevices:String[]()
	Local List       : Byte Ptr, ..
	      Specifiers : String[], ..
	      Specifier  : String

	' Null-terminated specifier list
	List = alcGetString(Null, ALC_CAPTURE_DEVICE_SPECIFIER)

	' Separate specifier by null character
	While List[0]
		Specifiers = Specifiers[..Specifiers.Length + 1]
		Specifiers[Specifiers.Length - 1] = String.FromCString(List)
		List :+ Specifiers[Specifiers.Length - 1].Length + 1
	Wend

	Return Specifiers
End Function
```


