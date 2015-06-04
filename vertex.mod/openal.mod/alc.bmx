SuperStrict

Const ALC_INVALID                          : Int = 0, ..
      ALC_VERSION_0_1                      : Int = 1

Const ALC_FALSE                            : Int = 0, ..     ' Boolean False
      ALC_TRUE                             : Int = 1, ..     ' Boolean True
      ALC_FREQUENCY                        : Int = $1007, .. ' followed by <int> Hz
      ALC_REFRESH                          : Int = $1008, .. ' followed by <int> Hz
      ALC_SYNC                             : Int = $1009, .. ' followed by AL_TRUE, AL_FALSE
      ALC_MONO_SOURCES                     : Int = $1010, .. ' followed by <int> Num of requested Mono (3D) Sources
      ALC_STEREO_SOURCES                   : Int = $1011     ' followed by <int> Num of requested Stereo Sources

' Errors

' No error
Const ALC_NO_ERROR                         : Int = ALC_FALSE

' No device
Const ALC_INVALID_DEVICE                   : Int = $A001

' Invalid context ID
Const ALC_INVALID_CONTEXT                  : Int = $A002

' Bad enum
Const ALC_INVALID_ENUM                     : Int = $A003

' Bad value
Const ALC_INVALID_VALUE                    : Int = $A004

' Out of memory.
Const ALC_OUT_OF_MEMORY                    : Int = $A005

' The specifier string of default device
Const ALC_DEFAULT_DEVICE_SPECIFIER         : Int = $1004, ..
      ALC_DEVICE_SPECIFIER                 : Int = $1005, ..
      ALC_EXTENSIONS                       : Int = $1006

Const ALC_MAJOR_VERSION                    : Int = $1000, ..
      ALC_MINOR_VERSION                    : Int = $1001

Const ALC_ATTRIBUTES_SIZE                  : Int = $1002, ..
      ALC_ALL_ATTRIBUTES                   : Int = $1003

' ALC_ENUMERATE_ALL_EXT enums
Const ALC_DEFAULT_ALL_DEVICES_SPECIFIER    : Int = $1012, ..
      ALC_ALL_DEVICES_SPECIFIER            : Int = $1013

' Capture extension
Const ALC_CAPTURE_DEVICE_SPECIFIER         : Int = $310, ..
      ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER : Int = $311, ..
      ALC_CAPTURE_SAMPLES                  : Int = $312

' Context Management
Global ..
alcCreateContext:Byte Ptr(device:Byte Ptr, attrlist:Int Ptr), ..
alcMakeContextCurrent:Int(context:Byte Ptr), ..
alcProcessContext(context:Byte Ptr), ..
alcSuspendContext(context:Byte Ptr), ..
alcDestroyContext(context:Byte Ptr), ..
alcGetCurrentContext:Byte Ptr(), ..
alcGetContextsDevice:Byte Ptr(context:Byte Ptr)

' Device management
Global ..
alcOpenDevice:Byte Ptr(devicename$z), ..
alcCloseDevice:Int(device:Byte Ptr)

' Error support
Global alcGetError:Int(device:Byte Ptr)

Rem
	Extension support.
	Query for the presence of an extension, and obtain any appropriate
	function pointers and enum values.
End Rem
Global ..
alcIsExtensionPresent:Int(device:Byte Ptr, extname$z), ..
alcGetProcAddress:Byte Ptr(device:Byte Ptr, funcname$z), ..
alcGetEnumValue:Int(device:Byte Ptr, enumname$z)

' Query functions
Global ..
alcGetString:Byte Ptr(device:Byte Ptr, param:Int), ..
alcGetIntegerv(device:Byte Ptr, param:Int, size:Int, data:Int Ptr)

' Capture functions
Global ..
alcCaptureOpenDevice:Byte Ptr(devicename$z, frequency:Int, format:Int, buffersize:Int), ..
alcCaptureCloseDevice:Int(device:Byte Ptr), ..
alcCaptureStart(device:Byte Ptr), ..
alcCaptureStop(device:Byte Ptr), ..
alcCaptureSamples(device:Byte Ptr, buffer:Byte Ptr, samples:Int)
