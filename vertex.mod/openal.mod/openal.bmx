SuperStrict

Module vertex.openal

ModuleInfo "Version: 1.10"
ModuleInfo "Author:  Oliver Skawronek"
ModuleInfo "License: GNU Lesser General Public License, Version 3"

Import "al.bmx"
Import "alc.bmx"
Import "alut.bmx"
Import "efx.bmx"

Private

Extern "OS"
	?Win32
		Function LoadLibrary:Int(lpLibFileName$z) = "LoadLibraryA@4"
		Function FreeLibrary:Int(hModule:Int) = "FreeLibrary@4"
		Function GetProcAddress:Byte Ptr(hModule:Int, lpProcName$z) = "GetProcAddress@8"
	?Linux
		Const RTLD_NOW : Int = 1
		Function dlopen:Int(file$z, mode:Int)
		Function dlclose:Int(handle:Int)
		Function dlsym:Byte Ptr(handle:Int, name$z)
	?MacOS
		' Sorry, comming soon
	?
End Extern

Public

Type TOpenAL
	Global Library : Int, ..
	       ALUT    : Int

	Function Open()
		?Win32
			Library = LoadLibrary("OpenAL32.dll")
		?Linux
			Library = dlopen("libopenal.so", RTDL_NOW)
			If Not Library Then Library = dlopen("libopenal.so.0.0.8", RTDL_NOW)
		?MacOS
			' Sorry, comming soon
		?
		If Not Library Then Throw("Unable to load OpenAL")
		OnEnd(TOpenAL.Close)
	End Function

	Function Close()
		If Not Library Then Return
		?Win32
			 FreeLibrary(Library)
		?Linux
			dlclose(Library)
		?MacOS
			' Sorry, comming soon
		?
	End Function

	Function OpenALUT()
		?Win32
			ALUT = LoadLibrary("alut.dll")
		?Linux
			ALUT = dlopen("libalut.so.0", RTDL_NOW)
			If Not ALUT Then ALUT = dlopen("libalut.so.0.1.0", RTDL_NOW)
		?MacOS
			' Sorry, comming soon
		?
		If Not ALUT Then Throw("Unable to load ALUT")
		OnEnd(TOpenAL.CloseALUT)
	End Function

	Function CloseALUT()
		If Not Library Then Return
		?Win32
			 FreeLibrary(ALUT)
		?Linux
			dlclose(ALUT)
		?MacOS
			' Sorry, comming soon
		?
	End Function

	Function InitAL()
		alEnable                      = AddressPointer("alEnable")
		alDisable                     = AddressPointer("alDisable")
		alIsEnabled                   = AddressPointer("alIsEnabled")
		alGetString                   = AddressPointer("alGetString")
		alGetBooleanv                 = AddressPointer("alGetBooleanv")
		alGetIntegerv                 = AddressPointer("alGetIntegerv")
		alGetFloatv                   = AddressPointer("alGetFloatv")
		alGetDoublev                  = AddressPointer("alGetDoublev")
		alGetBoolean                  = AddressPointer("alGetBoolean")
		alGetInteger                  = AddressPointer("alGetInteger")
		alGetFloat                    = AddressPointer("alGetFloat")
		alGetDouble                   = AddressPointer("alGetDouble")
		alGetError                    = AddressPointer("alGetError")
		alIsExtensionPresent          = AddressPointer("alIsExtensionPresent")
		alGetProcAddress              = AddressPointer("alGetProcAddress")
		alGetEnumValue                = AddressPointer("alGetEnumValue")
		alListenerf                   = AddressPointer("alListenerf")
		alListener3f                  = AddressPointer("alListener3f")
		alListenerfv                  = AddressPointer("alListenerfv")
		alListeneri                   = AddressPointer("alListeneri")
		alListener3i                  = AddressPointer("alListener3i")
		alListeneriv                  = AddressPointer("alListeneriv")
		alGetListenerf                = AddressPointer("alGetListenerf")
		alGetListener3f               = AddressPointer("alGetListener3f")
		alGetListenerfv               = AddressPointer("alGetListenerfv")
		alGetListener3i               = AddressPointer("alGetListener3i")
		alGetListeneriv               = AddressPointer("alGetListeneriv")
		alGenSources                  = AddressPointer("alGenSources")
		alDeleteSources               = AddressPointer("alDeleteSources")
		alIsSource                    = AddressPointer("alIsSource")
		alSourcef                     = AddressPointer("alSourcef")
		alSource3f                    = AddressPointer("alSource3f")
		alSourcefv                    = AddressPointer("alSourcefv")
		alSourcei                     = AddressPointer("alSourcei")
		alSource3i                    = AddressPointer("alSource3i")
		alSourceiv                    = AddressPointer("alSourceiv")
		alGetSourcef                  = AddressPointer("alGetSourcef")
		alGetSource3f                 = AddressPointer("alGetSource3f")
		alGetSourcefv                 = AddressPointer("alGetSourcefv")
		alGetSourcei                  = AddressPointer("alGetSourcei")
		alGetSource3i                 = AddressPointer("alGetSource3i")
		alGetSourceiv                 = AddressPointer("alGetSourceiv")
		alSourcePlayv                 = AddressPointer("alSourcePlayv")
		alSourceStopv                 = AddressPointer("alSourceStopv")
		alSourceRewindv               = AddressPointer("alSourceRewindv")
		alSourcePausev                = AddressPointer("alSourcePausev")
		alSourcePlay                  = AddressPointer("alSourcePlay")
		alSourceStop                  = AddressPointer("alSourceStop")
		alSourceRewind                = AddressPointer("alSourceRewind")
		alSourcePause                 = AddressPointer("alSourcePause")
		alSourceQueueBuffers          = AddressPointer("alSourceQueueBuffers")
		alSourceUnqueueBuffers        = AddressPointer("alSourceUnqueueBuffers")
		alGenBuffers                  = AddressPointer("alGenBuffers")
		alDeleteBuffers               = AddressPointer("alDeleteBuffers")
		alIsBuffer                    = AddressPointer("alIsBuffer")
		alBufferData                  = AddressPointer("alBufferData")
		alBufferf                     = AddressPointer("alBufferf")
		alBuffer3f                    = AddressPointer("alBuffer3f")
		alBufferfv                    = AddressPointer("alBufferfv")
		alBufferi                     = AddressPointer("alBufferi")
		alBuffer3i                    = AddressPointer("alBuffer3i")
		alBufferiv                    = AddressPointer("alBufferiv")
		alGetBufferf                  = AddressPointer("alGetBufferf")
		alGetBuffer3f                 = AddressPointer("alGetBuffer3f")
		alGetBufferfv                 = AddressPointer("alGetBufferfv")
		alGetBufferi                  = AddressPointer("alGetBufferi")
		alGetBuffer3i                 = AddressPointer("alGetBuffer3i")
		alGetBufferiv                 = AddressPointer("alGetBufferiv")
		alDopplerFactor               = AddressPointer("alDopplerFactor")
		alDopplerVelocity             = AddressPointer("alDopplerVelocity")
		alSpeedOfSound                = AddressPointer("alSpeedOfSound")
		alDistanceModel               = AddressPointer("alDistanceModel")
	End Function

	Function InitALC()
		alcCreateContext              = AddressPointer("alcCreateContext")
		alcMakeContextCurrent         = AddressPointer("alcMakeContextCurrent")
		alcProcessContext             = AddressPointer("alcProcessContext")
		alcSuspendContext             = AddressPointer("alcSuspendContext")
		alcDestroyContext             = AddressPointer("alcDestroyContext")
		alcGetCurrentContext          = AddressPointer("alcGetCurrentContext")
		alcGetContextsDevice          = AddressPointer("alcGetContextsDevice")
		alcOpenDevice                 = AddressPointer("alcOpenDevice")
		alcCloseDevice                = AddressPointer("alcCloseDevice")
		alcGetError                   = AddressPointer("alcGetError")
		alcIsExtensionPresent         = AddressPointer("alcIsExtensionPresent")
		alcGetProcAddress             = AddressPointer("alcGetProcAddress")
		alcGetEnumValue               = AddressPointer("alcGetEnumValue")
		alcGetString                  = AddressPointer("alcGetString")
		alcGetIntegerv                = AddressPointer("alcGetIntegerv")
		alcCaptureOpenDevice          = AddressPointer("alcCaptureOpenDevice")
		alcCaptureCloseDevice         = AddressPointer("alcCaptureCloseDevice")
		alcCaptureStart               = AddressPointer("alcCaptureStart")
		alcCaptureStop                = AddressPointer("alcCaptureStop")
		alcCaptureSamples             = AddressPointer("alcCaptureSamples")
	End Function
	
	Function InitALUT()
		alutInit                      = AddressPointer("alutInit")
		alutInitWithoutContext        = AddressPointer("alutInitWithoutContext")
		alutExit                      = AddressPointer("alutExit")
		alutGetError                  = AddressPointer("alutGetError")
		alutGetErrorString            = AddressPointer("alutGetErrorString")
		alutCreateBufferFromFile      = AddressPointer("alutCreateBufferFromFile")
		alutCreateBufferFromFileImage = AddressPointer("alutCreateBufferFromFileImage")
		alutCreateBufferHelloWorld    = AddressPointer("alutCreateBufferHelloWorld")
		alutCreateBufferWaveform	  = AddressPointer("alutCreateBufferWaveform")
		alutLoadMemoryFromFile        = AddressPointer("alutLoadMemoryFromFile")
		alutLoadMemoryFromFileImage   = AddressPointer("alutLoadMemoryFromFileImage")
		alutLoadMemoryHelloWorld      = AddressPointer("alutLoadMemoryHelloWorld")
		alutLoadMemoryWaveform        = AddressPointer("alutLoadMemoryWaveform")
		alutGetMIMETypes              = AddressPointer("alutGetMIMETypes")
		alutGetMajorVersion           = AddressPointer("alutGetMajorVersion")
		alutGetMinorVersion           = AddressPointer("alutGetMinorVersion")
		alutSleep                     = AddressPointer("alutSleep")
		alutLoadWAVFile               = AddressPointer("alutLoadWAVFile")
		alutLoadWAVMemory             = AddressPointer("alutLoadWAVMemory")
		alutUnloadWAV                 = AddressPointer("alutUnloadWAV")

		' Private
		Function AddressPointer:Byte Ptr(Name:String)
				Local Pointer : Byte Ptr

				If Not ALUT Then Throw("ALUT is not loaded")
				?Win32
					Pointer = GetProcAddress(ALUT, Name)
				?Linux
					Pointer = dlsym(ALUT, Name)
				?MacOS
					' Sorry, comming soon
				?

				If Not Pointer Then Throw("Unable to load ~q" + Name + "~q")
				Return Pointer
		End Function
	End Function
	
	Function InitEFX()
		alGenEffects                  = AddressPointer("alGenEffects", True)
		alDeleteEffects               = AddressPointer("alDeleteEffects", True)
		alIsEffect                    = AddressPointer("alIsEffect", True)
		alEffecti                     = AddressPointer("alEffecti", True)
		alEffectiv                    = AddressPointer("alEffectiv", True)
		alEffectf                     = AddressPointer("alEffectf", True)
		alEffectfv                    = AddressPointer("alEffectfv", True)
		alGetEffecti                  = AddressPointer("alGetEffecti", True)
		alGetEffectiv                 = AddressPointer("alGetEffectiv", True)
		alGetEffectf                  = AddressPointer("alGetEffectf", True)
		alGetEffectfv                 = AddressPointer("alGetEffectfv", True)
		alGenFilters                  = AddressPointer("alGenFilters", True)
		alDeleteFilters               = AddressPointer("alDeleteFilters", True)
		alIsFilter                    = AddressPointer("alIsFilter", True)
		alFilteri                     = AddressPointer("alFilteri", True)
		alFilteriv                    = AddressPointer("alFilteriv", True)
		alFilterf                     = AddressPointer("alFilterf", True)
		alFilterfv                    = AddressPointer("alFilterfv", True)
		alGetFilteri                  = AddressPointer("alGetFilteri", True)
		alGetFilteriv                 = AddressPointer("alGetFilteriv", True)
		alGetFilterf                  = AddressPointer("alGetFilterf", True)
		alGetFilterfv                 = AddressPointer("alGetFilterfv", True)
		alGenAuxiliaryEffectSlots     = AddressPointer("alGenAuxiliaryEffectSlots", True)
		alDeleteAuxiliaryEffectSlots  = AddressPointer("alDeleteAuxiliaryEffectSlots", True)
		alIsAuxiliaryEffectSlot       = AddressPointer("alIsAuxiliaryEffectSlot", True)
		alAuxiliaryEffectSloti        = AddressPointer("alAuxiliaryEffectSloti", True)
		alAuxiliaryEffectSlotiv       = AddressPointer("alAuxiliaryEffectSlotiv", True)
		alAuxiliaryEffectSlotf        = AddressPointer("alAuxiliaryEffectSlotf", True)
		alAuxiliaryEffectSlotfv       = AddressPointer("alAuxiliaryEffectSlotfv", True)
		alGetAuxiliaryEffectSloti     = AddressPointer("alGetAuxiliaryEffectSloti", True)
		alGetAuxiliaryEffectSlotiv    = AddressPointer("alGetAuxiliaryEffectSlotiv", True)
		alGetAuxiliaryEffectSlotf     = AddressPointer("alGetAuxiliaryEffectSlotf", True)
		alGetAuxiliaryEffectSlotfv    = AddressPointer("alGetAuxiliaryEffectSlotfv", True)
	End Function

	' Private
	Function AddressPointer:Byte Ptr(Name:String, UseLibraryFunction:Int = False)
			Local Pointer : Byte Ptr

			If UseLibraryFunction Then
				If Not alGetProcAddress Then Throw("OpenAL is not loaded")
				Pointer = alGetProcAddress(Name)
			Else
				If Not Library Then Throw("OpenAL is not initialized")
				?Win32
					Pointer = GetProcAddress(Library, Name)
				?Linux
					Pointer = dlsym(Library, Name)
				?MacOS
					' Sorry, comming soon
				?
			EndIf

			If Not Pointer Then Throw("Unable to load ~q" + Name + "~q")
			Return Pointer
	End Function
End Type
