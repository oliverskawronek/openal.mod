SuperStrict

Const ALUT_API_MAJOR_VERSION               : Int = 1, ..
      ALUT_API_MINOR_VERSION               : Int = 1

Const ALUT_ERROR_NO_ERROR                  : Int = 0, ..
      ALUT_ERROR_OUT_OF_MEMORY             : Int = $200, ..
      ALUT_ERROR_INVALID_ENUM              : Int = $201, ..
      ALUT_ERROR_INVALID_VALUE             : Int = $202, ..
      ALUT_ERROR_INVALID_OPERATION         : Int = $203, ..
      ALUT_ERROR_NO_CURRENT_CONTEXT        : Int = $204, ..
      ALUT_ERROR_AL_ERROR_ON_ENTRY         : Int = $205, ..
      ALUT_ERROR_ALC_ERROR_ON_ENTRY        : Int = $206, ..
      ALUT_ERROR_OPEN_DEVICE               : Int = $207, ..
      ALUT_ERROR_CLOSE_DEVICE              : Int = $208, ..
      ALUT_ERROR_CREATE_CONTEXT            : Int = $209, ..
      ALUT_ERROR_MAKE_CONTEXT_CURRENT      : Int = $20A, ..
      ALUT_ERROR_DESTROY_CONTEXT           : Int = $20B, ..
      ALUT_ERROR_GEN_BUFFERS               : Int = $20C, ..
      ALUT_ERROR_BUFFER_DATA               : Int = $20D, ..
      ALUT_ERROR_IO_ERROR                  : Int = $20E, ..
      ALUT_ERROR_UNSUPPORTED_FILE_TYPE     : Int = $20F, ..
      ALUT_ERROR_UNSUPPORTED_FILE_SUBTYPE  : Int = $210, ..
      ALUT_ERROR_CORRUPT_OR_TRUNCATED_DATA : Int = $211

Const ALUT_WAVEFORM_SINE                   : Int = $100, ..
      ALUT_WAVEFORM_SQUARE                 : Int = $101, ..
      ALUT_WAVEFORM_SAWTOOTH               : Int = $102, ..
      ALUT_WAVEFORM_WHITENOISE             : Int = $103, ..
      ALUT_WAVEFORM_IMPULSE                : Int = $104

Const ALUT_LOADER_BUFFER                   : Int = $300, ..
      ALUT_LOADER_MEMORY                   : Int = $301

Global ..
alutInit:Int(argcp:Int Ptr, argv:Byte Ptr), ..
alutInitWithoutContext:Int(argcp:Int Ptr, argv:Byte Ptr), ..
alutExit:Int()

Global ..
alutGetError:Int(), ..
alutGetErrorString:Byte Ptr(error:Int)

Global ..
alutCreateBufferFromFile:Int(fileName$z), ..
alutCreateBufferFromFileImage:Int(data:Byte Ptr, length:Int), ..
alutCreateBufferHelloWorld:Int(), ..
alutCreateBufferWaveform:Int(waveshape:Int, frequency:Float, phase:Float, duration:Float)

Global ..	
alutLoadMemoryFromFile:Byte Ptr(fileName$z, format:Int Ptr, size:Int Ptr, frequency:Float Ptr), ..
alutLoadMemoryFromFileImage:Byte Ptr(data:Byte Ptr, length:Int, format:Int Ptr, size:Int Ptr, frequency:Float Ptr), ..
alutLoadMemoryHelloWorld:Byte Ptr(format:Int Ptr, size:Int Ptr, frequency:Float Ptr), ..
alutLoadMemoryWaveform:Byte Ptr(waveshape:Int, frequency:Float, phase:Float, duration:Float, format:Int Ptr, size:Int Ptr, freq:Float Ptr)

Global alutGetMIMETypes:Byte Ptr(loader:Int)

Global ..
alutGetMajorVersion:Int(), ..
alutGetMinorVersion:Int()

Global alutSleep:Int(duration:Float)

?MacOS
	Global ..
 	alutLoadWAVFile(fileName$z, format:Int Ptr, data:Byte Ptr, size:Int Ptr, frequency:Int Ptr), ..
 	alutLoadWAVMemory(buffer:Byte Ptr, format:Int Ptr, data:Byte Ptr, size:Int Ptr, frequency:Int Ptr)
?Not MacOS
 	Global ..
 	alutLoadWAVFile(fileName$z, format:Int Ptr, data:Byte Ptr, size:Int Ptr, frequency:Int Ptr, loop:Int Ptr), ..
 	alutLoadWAVMemory(buffer:Byte Ptr, format:Int Ptr, data:Byte Ptr, size:Int Ptr, frequency:Int Ptr, loop:Int Ptr)
?
Global alutUnloadWAV(format:Int, data:Byte Ptr, size:Int, frequency:Int)
