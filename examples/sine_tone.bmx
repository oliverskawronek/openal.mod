SuperStrict

Framework brl.blitz
Import vertex.openal
Import brl.math

TOpenAL.Open()
TOpenAL.InitAL()
TOpenAL.InitALC()

' Generate a sine tone with a length of one second
Const SAMPLE_RATE : Int   = 44100
Const AMPLITUDE   : Float = 0.8 ' 0..1
Const FREQUENCY   : Float = 440 ' In Hertz [Hz]
Const OMEGA       : Float = 2*Pi*FREQUENCY ' Angular Frequency
Const RAD_TO_DEG  : Float = 360.0/(2*Pi)
Global Data : Byte[] = New Byte[SAMPLE_RATE * 2]
For Local I:Int = 0 Until SAMPLE_RATE
	Local Rad:Float = OMEGA * (Float(I)/Float(SAMPLE_RATE))
	Local Sample:Float = AMPLITUDE * Sin(Rad*RAD_TO_DEG)
	FloatTo16BitLittleEndian(Sample, Data, I * 2)
Next

Global Device  : Byte Ptr, ..
       Context : Byte Ptr

Device = alcOpenDevice(Null)
Context = alcCreateContext(Device, Null)
alcMakeContextCurrent(Context)

' A buffer holds the sample data
Global Buffer : Int
alGenBuffers(1, Varptr(Buffer))
alBufferData(Buffer, AL_FORMAT_MONO16, Data, SAMPLE_RATE * 2, SAMPLE_RATE)

' A source can play a buffer
Global Source : Int
alGenSources(1, Varptr(Source))
alSourcei(Source, AL_BUFFER, Buffer)

' Play the source and wait two seconds
alSourcePlay(Source)

' Wait while playing
Repeat
	Local State:Int
	alGetSourcei(Source, AL_SOURCE_STATE, Varptr(State))
	If (State <> AL_PLAYING) Then Exit
	Delay 10
Forever

alcMakeContextCurrent(Null)
alcDestroyContext(Context)
alcCloseDevice(Device)

TOpenAL.Close()
End

Function FloatTo16BitLittleEndian(Sample:Float, Buffer:Byte Ptr, Offset:Int)
	Assert -1.0 <= Sample And Sample <= 1.0
	Local value:Short = Sample * $8000
	Local Low:Byte = value & $FF
	Local High:Byte = (value Shr 8) & $FF
	Buffer[Offset] = Low
	Buffer[Offset + 1] = High
End Function
