SuperStrict

Rem
	Use ESC to exit
End Rem

Framework brl.blitz
Import vertex.openal
Import brl.math
Import brl.max2d
Import brl.glmax2d
Import "float_ring_buffer.bmx"

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
		
Graphics(800, 600)

Const SAMPLE_RATE : Int = 44100, ..   ' In Hertz [Hz]
      BUFFER_SIZE : Int = SAMPLE_RATE ' In Samples
' Null means using default capture device
Global CaptureDevice : Byte Ptr
CaptureDevice = alcCaptureOpenDevice(Null, 44100, AL_FORMAT_MONO16, BUFFER_SIZE)

Global Data : Byte[] = New Byte[BUFFER_SIZE * 2] ' 16 Bit per sample
Global RingBuffer : TFloatRingBuffer = TFloatRingBuffer.Create(BUFFER_SIZE)
Global Samples : Float[] = New Float[GraphicsWidth()]

alcCaptureStart(CaptureDevice)

While Not KeyDown(KEY_ESCAPE)
	' Read Samples
	Local NumAvailableSamples:Int
	alcGetIntegerv(CaptureDevice , ALC_CAPTURE_SAMPLES, 4, Varptr(NumAvailableSamples))
	If NumAvailableSamples > 0 Then
		alcCaptureSamples(CaptureDevice, Data, NumAvailableSamples)
		For Local I:Int = 0 Until NumAvailableSamples
			Local Offset:Int = I*2 ' 16 Bit per sample
			Local Sample:Float = DecodeSigned16BitLittleEndian(Data, Offset)
			RingBuffer.Put(Sample)
		Next
	EndIf
	
	If RingBuffer.GetSize() >= GraphicsWidth() Then
		RingBuffer.PeakLast(Samples, 0, GraphicsWidth())
	EndIf
	
	' Root Mean Square
	Local RMS:Float = 0
	Local Size:Int = GraphicsWidth()
	For Local I:Int = 0 Until Size
		RMS = RMS + (Samples[I] * Samples[I])
	Next
	RMS = Sqr(RMS / Size)
	Assert 0 <= RMS And RMS <= 1
	
	Cls()
	' Draw Intensity
	DrawRect 0, 0, RMS * GraphicsWidth(), 20
	
	' Draw wave form
	Local OldX:Int=0 ; Local OldY:Float=GraphicsHeight()/2
	For Local X:Int = 0 Until GraphicsWidth()
		Local Y:Float = Samples[X] * 100 + GraphicsHeight()/2
		DrawLine OldX, OldY, X, Y
		OldX = X ; OldY = Y
	Next

	Flip()
Wend

alcCaptureStop(CaptureDevice)

alcMakeContextCurrent(Null)
alcDestroyContext(Context)
alcCloseDevice(Device)

TOpenAL.Close()
EndGraphics()
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

Function DecodeSigned16BitLittleEndian:Float(Buffer:Byte Ptr, Offset:Int)
	Local LowerB:Byte, HigherB:Byte
	HigherB = Buffer[offset + 1]
	LowerB = Buffer[offset]
	Local SampleInt:Int = (HigherB Shl 8) | (LowerB & $ff)
	If SampleInt & $8000 Then SampleInt = $FFFF8000 | (SampleInt & $7FFF)
	Local Sample:Float = Float(SampleInt) / Float($7fff)
	Return Sample
End Function
