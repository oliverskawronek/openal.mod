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

WriteStdout(String.FromCString(alGetString(AL_VENDOR)) + "~n")
WriteStdout(String.FromCString(alGetString(AL_RENDERER)) + "~n")

alcMakeContextCurrent(Null)
alcDestroyContext(Context)
alcCloseDevice(Device)

TOpenAL.Close()
End
