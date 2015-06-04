SuperStrict

Const AL_INVALID                   : Int = -1, ..
      AL_ILLEGAL_ENUM              : Int = $A002, .. ' = AL_INVALID_ENUM
      AL_ILLEGAL_COMMAND           : Int = $A004     ' = AL_INVALID_OPERATION

' Enumerant values begin at column 50. No tabs.
Const AL_NONE                      : Int = 0, .. ' "no distance model" or "no buffer"
      AL_FALSE                     : Int = 0, .. ' Boolean False
      AL_TRUE                      : Int = 1, .. ' Boolean True
      AL_SOURCE_RELATIVE           : Int = $202  ' Indicate Source has relative coordinates.

Rem
	Directional source, inner cone angle, in degrees.
	Range:    [0-360] 
	Default:  360
End Rem
Const AL_CONE_INNER_ANGLE          : Int = $1001

Rem
	Directional source, outer cone angle, in degrees.
	Range:    [0-360] 
	Default:  360
End Rem
Const AL_CONE_OUTER_ANGLE          : Int = $1002

Rem
	Specify the pitch to be applied, either at source,
	or on mixer results, at listener.
	Range:   [0.5-2.0]
	Default: 1.0
End Rem
Const AL_PITCH                     : Int = $1003

Rem
	Specify the current location in three dimensional space.
	OpenAL, like OpenGL, uses a Right handed coordinate system,
	where in a frontal Default view X (thumb) points right, 
	Y points up (index finger), and Z points towards the
	viewer/camera (middle finger). 
	To switch from a Left handed coordinate system, flip the
	sign on the Z coordinate.
	Listener position is always in the world coordinate system.
End Rem
Const AL_POSITION                  : Int = $1004

' Specify the current direction.
Const AL_DIRECTION                 : Int = $1005

' Specify the current velocity in three dimensional space.
Const AL_VELOCITY                  : Int = $1006

Rem
	Indicate whether source is looping.
	Range:   [AL_TRUE, AL_FALSE]
	Default: False.
End Rem
Const AL_LOOPING                   : Int = $1007

Rem
 * Indicate the buffer to provide sound samples. 
 * Type: ALuint.
 * Range: any valid buffer id.
End Rem
Const AL_BUFFER                    : Int = $1009

Rem
 * Indicate the gain (volume amplification) applied. 
 * Type:   ALfloat.
 * Range:  ]0.0-  ]
 * A value of 1.0 means un-attenuated/unchanged.
 * Each division by 2 equals an attenuation of -6dB.
 * Each multiplicaton with 2 equals an amplification of +6dB.
 * A value of 0.0 is meaningless with respect to a logarithmic
 * scale; it is interpreted as zero volume - the channel
 * is effectively disabled.
End Rem
Const AL_GAIN                      : Int = $100A

Rem
	Indicate minimum source attenuation
	Type: ALfloat
	Range:  [0.0 - 1.0]
	
	Logarthmic
End Rem
Const AL_MIN_GAIN                  : Int = $100D

Rem
	Indicate maximum source attenuation
	Type: ALfloat
	Range:  [0.0 - 1.0]
	
	Logarthmic
End Rem
Const AL_MAX_GAIN                  : Int = $100E

Rem
	Indicate listener orientation.
End Rem
Const AL_ORIENTATION               : Int = $100F

' Source state information.
Const AL_SOURCE_STATE              : Int = $1010, ..
      AL_INITIAL                   : Int = $1011, ..
      AL_PLAYING                   : Int = $1012, ..
      AL_PAUSED                    : Int = $1013, ..
      AL_STOPPED                   : Int = $1014

' Buffer Queue params
Const AL_BUFFERS_QUEUED            : Int = $1015, ..
      AL_BUFFERS_PROCESSED         : Int = $1016

' Source buffer position information
Const AL_SEC_OFFSET                : Int = $1024, ..
      AL_SAMPLE_OFFSET             : Int = $1025, ..
      AL_BYTE_OFFSET               : Int = $1026

Rem
	Source type (static, streaming or undetermined)
	Source is static if a buffer has been attached using AL_BUFFER
	Source is streaming if one or more buffers have been attached using alSourceQueueBuffers
	Source is undetermined when it has the Null buffer attached
End Rem
Const AL_SOURCE_TYPE               : Int = $1027, ..
      AL_STATIC                    : Int = $1028, ..
      AL_STREAMING                 : Int = $1029, ..
      AL_UNDETERMINED              : Int = $1030

' Sound samples: format specifier.
Const AL_FORMAT_MONO8              : Int = $1100, ..
      AL_FORMAT_MONO16             : Int = $1101, ..
      AL_FORMAT_STEREO8            : Int = $1102, ..
      AL_FORMAT_STEREO16           : Int = $1103

Rem
	source specific reference distance
	Type: ALfloat
	Range:  0.0 - +inf
	
	At 0.0, no distance attenuation occurs.
    Default is 1.0.
End Rem
Const AL_REFERENCE_DISTANCE        : Int = $1020

Rem
	source specific rolloff factor
	Type: ALfloat
	Range:  0.0 - +Inf
End Rem
Const AL_ROLLOFF_FACTOR            : Int = $1021

Rem
	Directional source, outer cone gain.
	
	Default:  0.0
	Range:    [0.0 - 1.0]
	Logarithmic
End Rem
Const AL_CONE_OUTER_GAIN           : Int = $1022

Rem
	Indicate distance above which sources are not
	attenuated using the inverse clamped distance model.
	
	Default: +Inf
	Type: ALfloat
	Range:  0.0 - +Inf
End Rem
Const AL_MAX_DISTANCE              : Int = $1023

Rem
	Sound samples: frequency, in units of Hertz [Hz].
	This is the number of samples per second. Half of the
	sample frequency marks the maximum significant
	frequency component.
End Rem
Const AL_FREQUENCY                 : Int = $2001, ..
      AL_BITS                      : Int = $2002, ..
      AL_CHANNELS                  : Int = $2003, ..
      AL_SIZE                      : Int = $2004

Rem
	Buffer state.
	Not supported for public use (yet).
End Rem
Const AL_UNUSED                    : Int = $2010, ..
      AL_PENDING                   : Int = $2011, ..
      AL_PROCESSED                 : Int = $2012

' Errors: No Error.
Const AL_NO_ERROR                  : Int = AL_FALSE

' Invalid name paramater passed to AL call.
Const AL_INVALID_NAME              : Int = $A001

' Invalid parameter passed to AL call.
Const AL_INVALID_ENUM              : Int = $A002

' Invalid enum parameter value.
Const AL_INVALID_VALUE             : Int = $A003

' Illegal call.
Const AL_INVALID_OPERATION         : Int = $A004

' No mojo
Const AL_OUT_OF_MEMORY             : Int = $A005

' Context strings: Vendor Name.
Const AL_VENDOR                    : Int = $B001, ..
      AL_VERSION                   : Int = $B002, ..
      AL_RENDERER                  : Int = $B003, ..
      AL_EXTENSIONS                : Int = $B004

' Doppler scale. Default 1.0
Const AL_DOPPLER_FACTOR            : Int = $C000

' Tweaks speed of propagation.
Const AL_DOPPLER_VELOCITY          : Int = $C001

' Speed of sound in units per second
Const AL_SPEED_OF_SOUND            : Int = $C003

Rem
	Distance models used in conjunction with DistanceModel
	implicit: NONE, which disances distance attenuation.
End Rem
Const AL_DISTANCE_MODEL            : Int = $D000, ..
      AL_INVERSE_DISTANCE          : Int = $D001, ..
      AL_INVERSE_DISTANCE_CLAMPED  : Int = $D002, ..
      AL_LINEAR_DISTANCE           : Int = $D003, ..
      AL_LINEAR_DISTANCE_CLAMPED   : Int = $D004, ..
      AL_EXPONENT_DISTANCE         : Int = $D005, ..
      AL_EXPONENT_DISTANCE_CLAMPED : Int = $D006

' Render State management
Global ..
alEnable(capability:Int), ..
alDisable(capability:Int), ..
alIsEnabled:Int(capability:Int)

' State retrieval
Global ..
alGetString:Byte Ptr(param:Int), ..
alGetBooleanv(param:Int, data:Int Ptr), ..
alGetIntegerv(param:Int, data:Int Ptr), ..
alGetFloatv(param:Int, data:Float Ptr), ..
alGetDoublev(param:Int, data:Double Ptr), ..
alGetBoolean:Int(param:Int), ..
alGetInteger:Int(param:Int), ..
alGetFloat:Float(param:Int), ..
alGetDouble:Double(param:Int)

Rem
	Error support.
	Optain the most recent error generated in the AL state machine.
End Rem
Global alGetError:Int()

Rem
	Extension support.
	Query For the presence of an extension, and obtain any appropriate
	Function pointers and enum values.
End Rem
Global ..
alIsExtensionPresent:Int(extname$z), ..
alGetProcAddress:Byte Ptr(fname$z), ..
alGetEnumValue:Int(ename$z)

Rem
	Listener represents the location and orientation of the
	'user' in 3D-space.
	Gain         AL_GAIN         ALfloat
	Position     AL_POSITION     ALfloat[3]
	Velocity     AL_VELOCITY     ALfloat[3]
	Orientation  AL_ORIENTATION  ALfloat[6] (Forward Then Up vectors)
End Rem

' Set listener parameters
Global ..
alListenerf(param:Int, value:Float), ..
alListener3f(param:Int, value1:Float, value2:Float, value3:Float), ..
alListenerfv(param:Int, values:Float Ptr), ..
alListeneri(param:Int, value:Int), ..
alListener3i(param:Int, value1:Int, value2:Int, value3:Int), ..
alListeneriv(param:Int, values:Int Ptr)

' Get listener parameters
Global ..
alGetListenerf(param:Int, value:Float Ptr), ..
alGetListener3f(param:Int, value1:Float Ptr, value2:Float Ptr, value3:Float Ptr), ..
alGetListenerfv(param:Int, values:Float Ptr), ..
alGetListener3i(param:Int, value1:Int Ptr, value2:Int Ptr, value3:Int Ptr), ..
alGetListeneriv(param:Int, values:Int Ptr)

Rem
	Sources represent individual sound objects in 3D-space.
	Sources take the PCM data provided in the specified buffer,
	apply source-specific modifications, and then
	submit them To be mixed according to spatial arrangement etc.
	
	Gain                              AL_GAIN                 ALfloat
	Min Gain                          AL_MIN_GAIN             ALfloat
	Max Gain                          AL_MAX_GAIN             ALfloat
	Position                          AL_POSITION             ALfloat[3]
	Velocity                          AL_VELOCITY             ALfloat[3]
	Direction                         AL_DIRECTION            ALfloat[3]
	Head Relative Mode                AL_SOURCE_RELATIVE      ALint (AL_TRUE Or AL_FALSE)
	Reference Distance                AL_REFERENCE_DISTANCE   ALfloat
	Max Distance                      AL_MAX_DISTANCE         ALfloat
	RollOff Factor                    AL_ROLLOFF_FACTOR       ALfloat
	Inner Angle                       AL_CONE_INNER_ANGLE     ALint Or ALfloat
	Outer Angle                       AL_CONE_OUTER_ANGLE     ALint Or ALfloat
	Cone Outer Gain                   AL_CONE_OUTER_GAIN      ALint Or ALfloat
	Pitch                             AL_PITCH                ALfloat
	Looping                           AL_LOOPING              ALint (AL_TRUE Or AL_FALSE)
	MS Offset                         AL_MSEC_OFFSET          ALint Or ALfloat
	Byte Offset                       AL_BYTE_OFFSET          ALint Or ALfloat
	Sample Offset                     AL_SAMPLE_OFFSET        ALint Or ALfloat
	Attached Buffer                   AL_BUFFER               ALint
	State (Query only)                AL_SOURCE_STATE         ALint
	Buffers Queued (Query only)       AL_BUFFERS_QUEUED       ALint
	Buffers Processed (Query only)    AL_BUFFERS_PROCESSED    ALint
End Rem

' Create Source objects
Global alGenSources(n:Int, sources:Int Ptr)

' Delete Source objects
Global alDeleteSources(n:Int, sources:Int Ptr)

' Verify a handle is a valid Source
Global alIsSource:Int(sid:Int)

' Set source parameters
Global ..
alSourcef(sid:Int, param:Int, value:Float), ..
alSource3f(sid:Int, param:Int, value1:Float, value2:Float, value3:Float), ..
alSourcefv(sid:Int, param:Int, values:Float Ptr), ..
alSourcei(sid:Int, param:Int, value:Int), ..
alSource3i(sid:Int, param:Int, value1:Int, value2:Int, value3:Int), ..
alSourceiv(sid:Int, param:Int, value:Int Ptr)

' Get source parameters
Global ..
alGetSourcef(sid:Int, param:Int, value:Float Ptr), ..
alGetSource3f(sid:Int, param:Int, value1:Float Ptr, value2:Float Ptr, value3:Float Ptr), ..
alGetSourcefv(sid:Int, param:Int, values:Float Ptr), ..
alGetSourcei(sid:Int,  param:Int, value:Int Ptr), ..
alGetSource3i(sid:Int, param:Int, value1:Int Ptr, value2:Int Ptr, value3:Int Ptr), ..
alGetSourceiv(sid:Int,  param:Int, values:Int Ptr)

' Source vector based playback calls

' Play, replay, or resume (if paused) a list of sources
Global alSourcePlayv(ns:Int, sids:Int Ptr)

' Stop a list of sources
Global alSourceStopv(ns:Int, sids:Int Ptr)

' Rewind a list of sources
Global alSourceRewindv(ns:Int, sids:Int Ptr)

' Pause a list of sources
Global alSourcePausev(ns:Int, sids:Int Ptr)

' Source based playback calls

' Play, replay, or resume a source
Global alSourcePlay(sid:Int)

' Stop a source
Global alSourceStop(sid:Int)

' Rewind a source (set playback postiton to beginning)
Global alSourceRewind(sid:Int)

' Pause a source
Global alSourcePause(sid:Int)


' Source queuing
Global ..
alSourceQueueBuffers(sid:Int, numEntries:Int, bids:Int Ptr), ..
alSourceUnqueueBuffers(sid:Int, numEntries:Int, bids:Int Ptr)

Rem
	Buffer objects are storage space for sample data.
	Buffers are referred to by sources. One buffer can be used
	by multiple Sources.
	
	Frequency (Query only)    AL_FREQUENCY      ALint
	Size (Query only)         AL_SIZE           ALint
	Bits (Query only)         AL_BITS           ALint
	Channels (Query only)     AL_CHANNELS       ALint
End Rem

' Create buffer objects
Global alGenBuffers(n:Int, buffers:Int Ptr)

' Delete buffer objects
Global alDeleteBuffers(n:Int, buffers:Int Ptr)

' Verify a handle is a valid buffer
Global alIsBuffer:Byte(bid:Int)

' Specify the data to be copied into a buffer
Global alBufferData(bid:Int, format:Int, data:Byte Ptr, size:Int, freq:Int)

' Set buffer parameters
Global ..
alBufferf(sid:Int, param:Int, value:Float), ..
alBuffer3f(sid:Int, param:Int, value1:Float, value2:Float, value3:Float), ..
alBufferfv(sid:Int, param:Int, values:Float Ptr), ..
alBufferi(sid:Int, param:Int, value:Int), ..
alBuffer3i(sid:Int, param:Int, value1:Int, value2:Int, value3:Int), ..
alBufferiv(sid:Int, param:Int, value:Int Ptr)

' Get buffer parameters
Global ..
alGetBufferf(sid:Int, param:Int, value:Float Ptr), ..
alGetBuffer3f(sid:Int, param:Int, value1:Float Ptr, value2:Float Ptr, value3:Float Ptr), ..
alGetBufferfv(sid:Int, param:Int, values:Float Ptr), ..
alGetBufferi(sid:Int,  param:Int, value:Int Ptr), ..
alGetBuffer3i(sid:Int, param:Int, value1:Int Ptr, value2:Int Ptr, value3:Int Ptr), ..
alGetBufferiv(sid:Int,  param:Int, values:Int Ptr)

' Global Parameters
Global ..
alDopplerFactor(value:Float), ..
alDopplerVelocity(value:Float), ..
alSpeedOfSound(value:Float), ..
alDistanceModel(distanceModel:Int)
