SuperStrict

Import "al.bmx"

Const ALC_EXT_EFX_NAME                                   : String = "ALC_EXT_EFX"

Rem
	Context definitions to be used with alcCreateContext.
	These values must be unique and not conflict with other 
	al context values.
End Rem
Const ALC_EFX_MAJOR_VERSION                              : Int = $20001, ..
      ALC_EFX_MINOR_VERSION                              : Int = $20002, ..
      ALC_MAX_AUXILIARY_SENDS                            : Int = $20003

Rem
	Listener definitions to be used with alListener functions.
	These values must be unique and not conflict with other 
	al listener values.
End Rem
Const AL_METERS_PER_UNIT                                 : Int = $20004

Rem
	Source definitions to be used with alSource functions.
	These values must be unique and not conflict with other 
	al source values.
End Rem
Const AL_DIRECT_FILTER                                   : Int = $20005, ..
      AL_AUXILIARY_SEND_FILTER                           : Int = $20006, ..
      AL_AIR_ABSORPTION_FACTOR                           : Int = $20007, ..
      AL_ROOM_ROLLOFF_FACTOR                             : Int = $20008, ..
      AL_CONE_OUTER_GAINHF                               : Int = $20009, ..
      AL_DIRECT_FILTER_GAINHF_AUTO                       : Int = $2000A, ..
      AL_AUXILIARY_SEND_FILTER_GAIN_AUTO                 : Int = $2000B, ..
      AL_AUXILIARY_SEND_FILTER_GAINHF_AUTO               : Int = $2000C

Rem
	Effect object definitions to be used with alEffect functions.
	Effect parameter value definitions, ranges, and defaults
	appear farther down in this file.
End Rem

' Reverb parameters
Const AL_REVERB_DENSITY                                  : Int = $0001, ..
      AL_REVERB_DIFFUSION                                : Int = $0002, ..
      AL_REVERB_GAIN                                     : Int = $0003, ..
      AL_REVERB_GAINHF                                   : Int = $0004, ..
      AL_REVERB_DECAY_TIME                               : Int = $0005, ..
      AL_REVERB_DECAY_HFRATIO                            : Int = $0006, ..
      AL_REVERB_REFLECTIONS_GAIN                         : Int = $0007, ..
      AL_REVERB_REFLECTIONS_DELAY                        : Int = $0008, ..
      AL_REVERB_LATE_REVERB_GAIN                         : Int = $0009, ..
      AL_REVERB_LATE_REVERB_DELAY                        : Int = $000A, ..
      AL_REVERB_AIR_ABSORPTION_GAINHF                    : Int = $000B, ..
      AL_REVERB_ROOM_ROLLOFF_FACTOR                      : Int = $000C, ..
      AL_REVERB_DECAY_HFLIMIT                            : Int = $000D

' Chorus parameters
Const AL_CHORUS_WAVEFORM                                 : Int = $0001, ..
      AL_CHORUS_PHASE                                    : Int = $0002, ..
      AL_CHORUS_RATE                                     : Int = $0003, ..
      AL_CHORUS_DEPTH                                    : Int = $0004, ..
      AL_CHORUS_FEEDBACK                                 : Int = $0005, ..
      AL_CHORUS_DELAY                                    : Int = $0006

' Distortion parameters
Const AL_DISTORTION_EDGE                                 : Int = $0001, ..
      AL_DISTORTION_GAIN                                 : Int = $0002, ..
      AL_DISTORTION_LOWPASS_CUTOFF                       : Int = $0003, ..
      AL_DISTORTION_EQCENTER                             : Int = $0004, ..
      AL_DISTORTION_EQBANDWIDTH                          : Int = $0005

' Echo parameters
Const AL_ECHO_DELAY                                      : Int = $0001, ..
      AL_ECHO_LRDELAY                                    : Int = $0002, ..
      AL_ECHO_DAMPING                                    : Int = $0003, ..
      AL_ECHO_FEEDBACK                                   : Int = $0004, ..
      AL_ECHO_SPREAD                                     : Int = $0005

' Flanger parameters
Const AL_FLANGER_WAVEFORM                                : Int = $0001, ..
      AL_FLANGER_PHASE                                   : Int = $0002, ..
      AL_FLANGER_RATE                                    : Int = $0003, ..
      AL_FLANGER_DEPTH                                   : Int = $0004, ..
      AL_FLANGER_FEEDBACK                                : Int = $0005, ..
      AL_FLANGER_DELAY                                   : Int = $0006

' Frequencyshifter parameters
Const AL_FREQUENCY_SHIFTER_FREQUENCY                     : Int = $0001, ..
      AL_FREQUENCY_SHIFTER_LEFT_DIRECTION                : Int = $0002, ..
      AL_FREQUENCY_SHIFTER_RIGHT_DIRECTION               : Int = $0003

' Vocalmorpher parameters
Const AL_VOCAL_MORPHER_PHONEMEA                          : Int = $0001, ..
      AL_VOCAL_MORPHER_PHONEMEA_COARSE_TUNING            : Int = $0002, ..
      AL_VOCAL_MORPHER_PHONEMEB                          : Int = $0003, ..
      AL_VOCAL_MORPHER_PHONEMEB_COARSE_TUNING            : Int = $0004, ..
      AL_VOCAL_MORPHER_WAVEFORM                          : Int = $0005, ..
      AL_VOCAL_MORPHER_RATE                              : Int = $0006

' Pitchshifter parameters
Const AL_PITCH_SHIFTER_COARSE_TUNE                       : Int = $0001, ..
      AL_PITCH_SHIFTER_FINE_TUNE                         : Int = $0002

' Ringmodulator parameters
Const AL_RING_MODULATOR_FREQUENCY                        : Int = $0001, ..
      AL_RING_MODULATOR_HIGHPASS_CUTOFF                  : Int = $0002, ..
      AL_RING_MODULATOR_WAVEFORM                         : Int = $0003

' Autowah parameters
Const AL_AUTOWAH_ATTACK_TIME                             : Int = $0001, ..
      AL_AUTOWAH_RELEASE_TIME                            : Int = $0002, ..
      AL_AUTOWAH_RESONANCE                               : Int = $0003, ..
      AL_AUTOWAH_PEAK_GAIN                               : Int = $0004

' Compressor parameters
Const AL_COMPRESSOR_ONOFF                                : Int = $0001

' Equalizer parameters
Const AL_EQUALIZER_LOW_GAIN                              : Int = $0001, ..
      AL_EQUALIZER_LOW_CUTOFF                            : Int = $0002, ..
      AL_EQUALIZER_MID1_GAIN                             : Int = $0003, ..
      AL_EQUALIZER_MID1_CENTER                           : Int = $0004, ..
      AL_EQUALIZER_MID1_WIDTH                            : Int = $0005, ..
      AL_EQUALIZER_MID2_GAIN                             : Int = $0006, ..
      AL_EQUALIZER_MID2_CENTER                           : Int = $0007, ..
      AL_EQUALIZER_MID2_WIDTH                            : Int = $0008, ..
      AL_EQUALIZER_HIGH_GAIN                             : Int = $0009, ..
      AL_EQUALIZER_HIGH_CUTOFF                           : Int = $000A

' Effect type
Const AL_EFFECT_FIRST_PARAMETER                          : Int = $0000, ..
      AL_EFFECT_LAST_PARAMETER                           : Int = $8000, ..
      AL_EFFECT_TYPE                                     : Int = $8001

' Effect Type definitions to be used with AL_EFFECT_TYPE.

' Can also be used as an fffect object id
Const AL_EFFECT_NULL                                     : Int = $0000

Const AL_EFFECT_REVERB                                   : Int = $0001, ..
      AL_EFFECT_CHORUS                                   : Int = $0002, ..
      AL_EFFECT_DISTORTION                               : Int = $0003, ..
      AL_EFFECT_ECHO                                     : Int = $0004, ..
      AL_EFFECT_FLANGER                                  : Int = $0005, ..
      AL_EFFECT_FREQUENCY_SHIFTER                        : Int = $0006, ..
      AL_EFFECT_VOCAL_MORPHER                            : Int = $0007, ..
      AL_EFFECT_PITCH_SHIFTER                            : Int = $0008, ..
      AL_EFFECT_RING_MODULATOR                           : Int = $0009, ..
      AL_EFFECT_AUTOWAH                                  : Int = $000A, ..
      AL_EFFECT_COMPRESSOR                               : Int = $000B, ..
      AL_EFFECT_EQUALIZER                                : Int = $000C

' Auxiliary slot object definitions to be used with alAuxiliaryEffectSlot functions.
Const AL_EFFECTSLOT_EFFECT                               : Int = $0001, ..
      AL_EFFECTSLOT_GAIN                                 : Int = $0002, ..
      AL_EFFECTSLOT_AUXILIARY_SEND_AUTO                  : Int = $0003

' Value to be used as an auxiliary slot id to disable a source send..
Const AL_EFFECTSLOT_NULL                                 : Int = $0000

' Filter object definitions to be used with alFilter functions.

' Lowpass parameters
Const AL_LOWPASS_GAIN                                    : Int = $0001, ..
      AL_LOWPASS_GAINHF                                  : Int = $0002

' Highpass parameters
Const AL_HIGHPASS_GAIN                                   : Int = $0001, ..
      AL_HIGHPASS_GAINLF                                 : Int = $0002

' Bandpass parameters
Const AL_BANDPASS_GAIN                                   : Int = $0001, ..
      AL_BANDPASS_GAINLF                                 : Int = $0002, ..
      AL_BANDPASS_GAINHF                                 : Int = $0003

' Filter type
Const AL_FILTER_FIRST_PARAMETER                          : Int = $0000, ..
      AL_FILTER_LAST_PARAMETER                           : Int = $8000, ..
      AL_FILTER_TYPE                                     : Int = $8001

' Filter type definitions To be used with AL_FILTER_TYPE.

' Can also be used as a filter object id
Const AL_FILTER_NULL                                     : Int = $0000

Const AL_FILTER_LOWPASS                                  : Int = $0001, ..
      AL_FILTER_HIGHPASS                                 : Int = $0002, ..
      AL_FILTER_BANDPASS                                 : Int = $0003

' Effect object functions.

' Create Effect objects.
Global alGenEffects(n:Int, effects:Int Ptr)

' Delete effect objects.
Global alDeleteEffects(n:Int, effects:Int Ptr)

' Verify a handle is a valid effect.
Global alIsEffect:Int(eid:Int)

' Set an integer parameter for an effect object.
Global ..
alEffecti(eid:Int, param:Int, value:Int), ..
alEffectiv(eid:Int, param:Int, values:Int Ptr)

' Set a floating point parameter for an effect object.
Global ..
alEffectf(eid:Int, param:Int, value:Float), ..
alEffectfv(eid:Int, param:Int, values:Float Ptr)

' Get an integer parameter for an effect object.
Global ..
alGetEffecti(eid:Int, pname:Int, value:Int Ptr), ..
alGetEffectiv(eid:Int, pname:Int, values:Int Ptr)

' Get an floating point parameter for an effect object.
Global ..
alGetEffectf(eid:Int, pname:Int, value:Float Ptr), ..
alGetEffectfv(eid:Int, pname:Int, values:Float Ptr)

' Filter object functions

' Create filter objects.
Global alGenFilters(n:Int, filters:Int Ptr)

' Delete filter objects.
Global alDeleteFilters(n:Int, filters:Int Ptr)

' Verify a handle is a valid filter.
Global alIsFilter:Int(fid:Int)

' Set an integer parameter for a filter object.
Global ..
alFilteri(fid:Int, param:Int, value:Int), ..
alFilteriv(fid:Int, param:Int, values:Int Ptr)

' Set a floating point parameter for an filter object.
Global ..
alFilterf(fid:Int, param:Int, value:Float), ..
alFilterfv(fid:Int, param:Int, values:Float Ptr)

' Get an integer parameter for a filter object.
Global ..
alGetFilteri(fid:Int, pname:Int, value:Int Ptr), ..
alGetFilteriv(fid:Int, pname:Int, values:Int Ptr)

' Get a floating point parameter for a filter object.
Global ..
alGetFilterf(fid:Int, pname:Int, value:Float Ptr), ..
alGetFilterfv(fid:Int, pname:Int, values:Float Ptr)

' Auxiliary slot object functions

' Create auxiliary slot objects.
Global alGenAuxiliaryEffectSlots(n:Int, slots:Int Ptr)

' Delete auxiliary slot objects.
Global alDeleteAuxiliaryEffectSlots(n:Int, slots:Int Ptr)

' Verify a handle is a valid auxiliary slot.
Global alIsAuxiliaryEffectSlot:Int(slot:Int)

' Set an integer parameter for a auxiliary slot object.
Global ..
alAuxiliaryEffectSloti(asid:Int, param:Int, value:Int), ..
alAuxiliaryEffectSlotiv(asid:Int, param:Int, values:Int Ptr)

' Set a floating point parameter for an auxiliary slot object.
Global ..
alAuxiliaryEffectSlotf(asid:Int, param:Int, value:Float), ..
alAuxiliaryEffectSlotfv(asid:Int, param:Int, values:Float Ptr)

' Get an integer parameter for a auxiliary slot object.
Global ..
alGetAuxiliaryEffectSloti(asid:Int, pname:Int, value:Int Ptr), ..
alGetAuxiliaryEffectSlotiv(asid:Int, pname:Int, values:Int Ptr)

' Get a floating point parameter for a auxiliary slot object.
Global ..
alGetAuxiliaryEffectSlotf(asid:Int, pname:Int, value:Float Ptr), ..
alGetAuxiliaryEffectSlotfv(asid:Int, pname:Int, values:Float Ptr)

' Filter ranges and defaults.

' Lowpass filter
Const LOWPASS_MIN_GAIN                                   : Float = 0.0, ..
      LOWPASS_MAX_GAIN                                   : Float = 1.0, ..
      LOWPASS_DEFAULT_GAIN                               : Float = 1.0

Const LOWPASS_MIN_GAINHF                                 : Float = 0.0, ..
      LOWPASS_MAX_GAINHF                                 : Float = 1.0, ..
      LOWPASS_DEFAULT_GAINHF                             : Float = 1.0

' Highpass filter
Const HIGHPASS_MIN_GAIN                                  : Float = 0.0, ..
      HIGHPASS_MAX_GAIN                                  : Float = 1.0, ..
      HIGHPASS_DEFAULT_GAIN                              : Float = 1.0

Const HIGHPASS_MIN_GAINLF                                : Float = 0.0, ..
      HIGHPASS_MAX_GAINLF                                : Float = 1.0, ..
      HIGHPASS_DEFAULT_GAINLF                            : Float = 1.0

' Bandpass filter
Const BANDPASS_MIN_GAIN                                  : Float = 0.0, ..
      BANDPASS_MAX_GAIN                                  : Float = 1.0, ..
      BANDPASS_DEFAULT_GAIN                              : Float = 1.0

Const BANDPASS_MIN_GAINHF                                : Float = 0.0, ..
      BANDPASS_MAX_GAINHF                                : Float = 1.0, ..
      BANDPASS_DEFAULT_GAINHF                            : Float = 1.0

Const BANDPASS_MIN_GAINLF                                : Float = 0.0, ..
      BANDPASS_MAX_GAINLF                                : Float = 1.0, ..
      BANDPASS_DEFAULT_GAINLF                            : Float = 1.0

' Effect parameter structures, value definitions, ranges and defaults.

' AL reverb effect parameter ranges and defaults
Const AL_REVERB_MIN_DENSITY                              : Float = 0.0, ..
      AL_REVERB_MAX_DENSITY                              : Float = 1.0, ..
      AL_REVERB_DEFAULT_DENSITY                          : Float = 1.0

Const AL_REVERB_MIN_DIFFUSION                            : Float = 0.0, ..
      AL_REVERB_MAX_DIFFUSION                            : Float = 1.0, ..
      AL_REVERB_DEFAULT_DIFFUSION                        : Float = 1.0

Const AL_REVERB_MIN_GAIN                                 : Float = 0.0, ..
      AL_REVERB_MAX_GAIN                                 : Float = 1.0, ..
      AL_REVERB_DEFAULT_GAIN                             : Float = 0.32

Const AL_REVERB_MIN_GAINHF                               : Float = 0.0, ..
      AL_REVERB_MAX_GAINHF                               : Float = 1.0, ..
      AL_REVERB_DEFAULT_GAINHF                           : Float = 0.89

Const AL_REVERB_MIN_DECAY_TIME                           : Float = 0.1, ..
      AL_REVERB_MAX_DECAY_TIME                           : Float = 20.0, ..
      AL_REVERB_DEFAULT_DECAY_TIME                       : Float = 1.49

Const AL_REVERB_MIN_DECAY_HFRATIO                        : Float = 0.1, ..
      AL_REVERB_MAX_DECAY_HFRATIO                        : Float = 2.0, ..
      AL_REVERB_DEFAULT_DECAY_HFRATIO                    : Float = 0.83

Const AL_REVERB_MIN_REFLECTIONS_GAIN                     : Float = 0.0, ..
      AL_REVERB_MAX_REFLECTIONS_GAIN                     : Float = 3.16, ..
      AL_REVERB_DEFAULT_REFLECTIONS_GAIN                 : Float = 0.05

Const AL_REVERB_MIN_REFLECTIONS_DELAY                    : Float = 0.0, ..
      AL_REVERB_MAX_REFLECTIONS_DELAY                    : Float = 0.3, ..
      AL_REVERB_DEFAULT_REFLECTIONS_DELAY                : Float = 0.007

Const AL_REVERB_MIN_LATE_REVERB_GAIN                     : Float = 0.0, ..
      AL_REVERB_MAX_LATE_REVERB_GAIN                     : Float = 10.0, ..
      AL_REVERB_DEFAULT_LATE_REVERB_GAIN                 : Float = 1.26

Const AL_REVERB_MIN_LATE_REVERB_DELAY                    : Float = 0.0, ..
      AL_REVERB_MAX_LATE_REVERB_DELAY                    : Float = 0.1, ..
      AL_REVERB_DEFAULT_LATE_REVERB_DELAY                : Float = 0.011

Const AL_REVERB_MIN_AIR_ABSORPTION_GAINHF                : Float = 0.892, ..
      AL_REVERB_MAX_AIR_ABSORPTION_GAINHF                : Float = 1.0, ..
      AL_REVERB_DEFAULT_AIR_ABSORPTION_GAINHF            : Float = 0.994

Const AL_REVERB_MIN_ROOM_ROLLOFF_FACTOR                  : Float = 0.0, ..
      AL_REVERB_MAX_ROOM_ROLLOFF_FACTOR                  : Float = 10.0, ..
      AL_REVERB_DEFAULT_ROOM_ROLLOFF_FACTOR              : Float = 0.0

Const AL_REVERB_MIN_DECAY_HFLIMIT                        : Int = AL_FALSE, ..
      AL_REVERB_MAX_DECAY_HFLIMIT                        : Int = AL_TRUE, ..
      AL_REVERB_DEFAULT_DECAY_HFLIMIT                    : Int = AL_TRUE

' AL distortion effect parameter ranges and defaults
Const AL_DISTORTION_MIN_EDGE                             : Float = 0.0, ..
      AL_DISTORTION_MAX_EDGE                             : Float = 1.0, ..
      AL_DISTORTION_DEFAULT_EDGE                         : Float = 0.2

Const AL_DISTORTION_MIN_GAIN                             : Float = 0.01, ..
      AL_DISTORTION_MAX_GAIN                             : Float = 1.0, ..
      AL_DISTORTION_DEFAULT_GAIN                         : Float = 0.05

Const AL_DISTORTION_MIN_LOWPASS_CUTOFF                   : Float = 80.0, ..
      AL_DISTORTION_MAX_LOWPASS_CUTOFF                   : Float = 24000.0, ..
      AL_DISTORTION_DEFAULT_LOWPASS_CUTOFF               : Float = 8000.0

Const AL_DISTORTION_MIN_EQCENTER                         : Float = 80.0, ..
      AL_DISTORTION_MAX_EQCENTER                         : Float = 24000.0, ..
      AL_DISTORTION_DEFAULT_EQCENTER                     : Float = 3600.0

Const AL_DISTORTION_MIN_EQBANDWIDTH                      : Float = 80.0, ..
      AL_DISTORTION_MAX_EQBANDWIDTH                      : Float = 24000.0, ..
      AL_DISTORTION_DEFAULT_EQBANDWIDTH                  : Float = 3600.0

' AL echo effect parameter ranges and defaults
Const AL_ECHO_MIN_DELAY                                  : Float = 0.0, ..
      AL_ECHO_MAX_DELAY                                  : Float = 0.207, ..
      AL_ECHO_DEFAULT_DELAY                              : Float = 0.1

Const AL_ECHO_MIN_LRDELAY                                : Float = 0.0, ..
      AL_ECHO_MAX_LRDELAY                                : Float = 0.404, ..
      AL_ECHO_DEFAULT_LRDELAY                            : Float = 0.1

Const AL_ECHO_MIN_DAMPING                                : Float = 0.0, ..
      AL_ECHO_MAX_DAMPING                                : Float = 0.99, ..
      AL_ECHO_DEFAULT_DAMPING                            : Float = 0.5

Const AL_ECHO_MIN_FEEDBACK                               : Float = 0.0, ..
      AL_ECHO_MAX_FEEDBACK                               : Float = 1.0, ..
      AL_ECHO_DEFAULT_FEEDBACK                           : Float = 0.5

Const AL_ECHO_MIN_SPREAD                                 : Float = -1.0, ..
      AL_ECHO_MAX_SPREAD                                 : Float = 1.0, ..
      AL_ECHO_DEFAULT_SPREAD                             : Float = -1.0

' AL flanger effect parameter ranges and defaults
Const AL_FLANGER_MIN_WAVEFORM                            : Int = 0, ..
      AL_FLANGER_MAX_WAVEFORM                            : Int = 1, ..
      AL_FLANGER_DEFAULT_WAVEFORM                        : Int = 1

Const AL_FLANGER_WAVEFORM_SINUSOID                       : Int = 0, ..
      AL_FLANGER_WAVEFORM_TRIANGLE                       : Int = 1

Const AL_FLANGER_MIN_PHASE                               : Int = -180, ..
      AL_FLANGER_MAX_PHASE                               : Int = 180, ..
      AL_FLANGER_DEFAULT_PHASE                           : Int = 90

Const AL_FLANGER_MIN_RATE                                : Float = 0.0, ..
      AL_FLANGER_MAX_RATE                                : Float = 10.0, ..
      AL_FLANGER_DEFAULT_RATE                            : Float = 0.27

Const AL_FLANGER_MIN_DEPTH                               : Float = 0.0, ..
      AL_FLANGER_MAX_DEPTH                               : Float = 1.0, ..
      AL_FLANGER_DEFAULT_DEPTH                           : Float = 1.0

Const AL_FLANGER_MIN_FEEDBACK                            : Float = -1.0, ..
      AL_FLANGER_MAX_FEEDBACK                            : Float = 1.0, ..
      AL_FLANGER_DEFAULT_FEEDBACK                        : Float = -0.5

Const AL_FLANGER_MIN_DELAY                               : Float = 0.0, ..
      AL_FLANGER_MAX_DELAY                               : Float = 0.004, ..
      AL_FLANGER_DEFAULT_DELAY                           : Float = 0.002

' AL frequency shifter effect parameter ranges and defaults
Const AL_FREQUENCY_SHIFTER_MIN_FREQUENCY                 : Float = 0.0, ..
      AL_FREQUENCY_SHIFTER_MAX_FREQUENCY                 : Float = 24000.0, ..
      AL_FREQUENCY_SHIFTER_DEFAULT_FREQUENCY             : Float = 0.0

Const AL_FREQUENCY_SHIFTER_MIN_LEFT_DIRECTION            : Int = 0, ..
      AL_FREQUENCY_SHIFTER_MAX_LEFT_DIRECTION            : Int = 2, ..
      AL_FREQUENCY_SHIFTER_DEFAULT_LEFT_DIRECTION        : Int = 0

Const AL_FREQUENCY_SHIFTER_MIN_RIGHT_DIRECTION           : Int = 0, ..
      AL_FREQUENCY_SHIFTER_MAX_RIGHT_DIRECTION           : Int = 2, ..
      AL_FREQUENCY_SHIFTER_DEFAULT_RIGHT_DIRECTION       : Int = 0

Const AL_FREQUENCY_SHIFTER_DIRECTION_DOWN                : Int = 0, ..
      AL_FREQUENCY_SHIFTER_DIRECTION_UP                  : Int = 1, ..
      AL_FREQUENCY_SHIFTER_DIRECTION_OFF                 : Int = 2

' AL vocal morpher effect parameter ranges and defaults
Const AL_VOCAL_MORPHER_MIN_PHONEMEA                      : Int = 0, ..
      AL_VOCAL_MORPHER_MAX_PHONEMEA                      : Int = 29, ..
      AL_VOCAL_MORPHER_DEFAULT_PHONEMEA                  : Int = 0

Const AL_VOCAL_MORPHER_MIN_PHONEMEA_COARSE_TUNING	     : Int = -24, ..
      AL_VOCAL_MORPHER_MAX_PHONEMEA_COARSE_TUNING	     : Int = 24, ..
      AL_VOCAL_MORPHER_DEFAULT_PHONEMEA_COARSE_TUNING    : Int = 0

Const AL_VOCAL_MORPHER_MIN_PHONEMEB                      : Int = 0, ..
      AL_VOCAL_MORPHER_MAX_PHONEMEB                      : Int = 29, ..
      AL_VOCAL_MORPHER_DEFAULT_PHONEMEB                  : Int = 10

Const AL_VOCAL_MORPHER_PHONEME_A                         : Int = 0, ..
      AL_VOCAL_MORPHER_PHONEME_E                         : Int = 1, ..
      AL_VOCAL_MORPHER_PHONEME_I                         : Int = 2, ..
      AL_VOCAL_MORPHER_PHONEME_O                         : Int = 3, ..
      AL_VOCAL_MORPHER_PHONEME_U                         : Int = 4, ..
      AL_VOCAL_MORPHER_PHONEME_AA                        : Int = 5, ..
      AL_VOCAL_MORPHER_PHONEME_AE                        : Int = 6, ..
      AL_VOCAL_MORPHER_PHONEME_AH                        : Int = 7, ..
      AL_VOCAL_MORPHER_PHONEME_AO                        : Int = 8, ..
      AL_VOCAL_MORPHER_PHONEME_EH                        : Int = 9, ..
      AL_VOCAL_MORPHER_PHONEME_ER                        : Int = 10, ..
      AL_VOCAL_MORPHER_PHONEME_IH                        : Int = 11, ..
      AL_VOCAL_MORPHER_PHONEME_IY                        : Int = 12, ..
      AL_VOCAL_MORPHER_PHONEME_UH                        : Int = 13, ..
      AL_VOCAL_MORPHER_PHONEME_UW                        : Int = 14, ..
      AL_VOCAL_MORPHER_PHONEME_B                         : Int = 15, ..
      AL_VOCAL_MORPHER_PHONEME_D                         : Int = 16, ..
      AL_VOCAL_MORPHER_PHONEME_F                         : Int = 17, ..
      AL_VOCAL_MORPHER_PHONEME_G                         : Int = 18, ..
      AL_VOCAL_MORPHER_PHONEME_J                         : Int = 19, ..
      AL_VOCAL_MORPHER_PHONEME_K                         : Int = 20, ..
      AL_VOCAL_MORPHER_PHONEME_L                         : Int = 21, ..
      AL_VOCAL_MORPHER_PHONEME_M                         : Int = 22, ..
      AL_VOCAL_MORPHER_PHONEME_N                         : Int = 23, ..
      AL_VOCAL_MORPHER_PHONEME_P                         : Int = 24, ..
      AL_VOCAL_MORPHER_PHONEME_R                         : Int = 25, ..
      AL_VOCAL_MORPHER_PHONEME_S                         : Int = 26, ..
      AL_VOCAL_MORPHER_PHONEME_T                         : Int = 27, ..
      AL_VOCAL_MORPHER_PHONEME_V                         : Int = 28, ..
      AL_VOCAL_MORPHER_PHONEME_Z                         : Int = 29

Const AL_VOCAL_MORPHER_MIN_PHONEMEB_COARSE_TUNING        : Int = -24, ..
      AL_VOCAL_MORPHER_MAX_PHONEMEB_COARSE_TUNING        : Int = 24, ..
      AL_VOCAL_MORPHER_DEFAULT_PHONEMEB_COARSE_TUNING    : Int = 0

Const AL_VOCAL_MORPHER_MIN_WAVEFORM                      : Int = 0, ..
      AL_VOCAL_MORPHER_MAX_WAVEFORM                      : Int = 2, ..
      AL_VOCAL_MORPHER_DEFAULT_WAVEFORM                  : Int = 0

Const AL_VOCAL_MORPHER_WAVEFORM_SINUSOID                 : Int = 0, ..
      AL_VOCAL_MORPHER_WAVEFORM_TRIANGLE                 : Int = 1, ..
      AL_VOCAL_MORPHER_WAVEFORM_SAWTOOTH                 : Int = 2

Const AL_VOCAL_MORPHER_MIN_RATE                          : Float = 0.0, ..
      AL_VOCAL_MORPHER_MAX_RATE                          : Float = 10.0, ..
      AL_VOCAL_MORPHER_DEFAULT_RATE                      : Float = 1.41

' AL pitch shifter effect parameter ranges and defaults
Const AL_PITCH_SHIFTER_MIN_COARSE_TUNE                   : Int = -12, ..
      AL_PITCH_SHIFTER_MAX_COARSE_TUNE                   : Int = 12, ..
      AL_PITCH_SHIFTER_DEFAULT_COARSE_TUNE               : Int = 12

Const AL_PITCH_SHIFTER_MIN_FINE_TUNE                     : Int = -50, ..
      AL_PITCH_SHIFTER_MAX_FINE_TUNE                     : Int = 50, ..
      AL_PITCH_SHIFTER_DEFAULT_FINE_TUNE                 : Int = 0

' AL ring modulator effect parameter ranges and defaults
Const AL_RING_MODULATOR_MIN_FREQUENCY                    : Float = 0.0, ..
      AL_RING_MODULATOR_MAX_FREQUENCY                    : Float = 8000.0, ..
      AL_RING_MODULATOR_DEFAULT_FREQUENCY                : Float = 440.0

Const AL_RING_MODULATOR_MIN_HIGHPASS_CUTOFF              : Float = 0.0, ..
      AL_RING_MODULATOR_MAX_HIGHPASS_CUTOFF              : Float = 24000.0, ..
      AL_RING_MODULATOR_DEFAULT_HIGHPASS_CUTOFF          : Float = 800.0

Const AL_RING_MODULATOR_MIN_WAVEFORM                     : Int = 0, ..
      AL_RING_MODULATOR_MAX_WAVEFORM                     : Int = 2, ..
      AL_RING_MODULATOR_DEFAULT_WAVEFORM                 : Int = 0

Const AL_RING_MODULATOR_SINUSOID                         : Int = 0, ..
      AL_RING_MODULATOR_SAWTOOTH                         : Int = 1, ..
      AL_RING_MODULATOR_SQUARE                           : Int = 2

' AL autowah effect parameter ranges and defaults
Const AL_AUTOWAH_MIN_ATTACK_TIME                         : Float = 0.0001, ..
      AL_AUTOWAH_MAX_ATTACK_TIME                         : Float = 1.0, ..
      AL_AUTOWAH_DEFAULT_ATTACK_TIME                     : Float = 0.06

Const AL_AUTOWAH_MIN_RELEASE_TIME                        : Float = 0.0001, ..
      AL_AUTOWAH_MAX_RELEASE_TIME                        : Float = 1.0, ..
      AL_AUTOWAH_DEFAULT_RELEASE_TIME                    : Float = 0.06

Const AL_AUTOWAH_MIN_RESONANCE                           : Float = 2.0, ..
      AL_AUTOWAH_MAX_RESONANCE                           : Float = 1000.0, ..
      AL_AUTOWAH_DEFAULT_RESONANCE                       : Float = 1000.0
	
Const AL_AUTOWAH_MIN_PEAK_GAIN                           : Float = 0.00003, ..
      AL_AUTOWAH_MAX_PEAK_GAIN                           : Float = 31621.0, ..
      AL_AUTOWAH_DEFAULT_PEAK_GAIN                       : Float = 11.22

' AL compressor effect parameter ranges and defaults
Const AL_COMPRESSOR_MIN_ONOFF                            : Int = 0, ..
      AL_COMPRESSOR_MAX_ONOFF                            : Int = 1, ..
      AL_COMPRESSOR_DEFAULT_ONOFF                        : Int = 1

' AL equalizer effect parameter ranges and defaults
Const AL_EQUALIZER_MIN_LOW_GAIN                          : Float = 0.126, ..
      AL_EQUALIZER_MAX_LOW_GAIN                          : Float = 7.943, ..
      AL_EQUALIZER_DEFAULT_LOW_GAIN                      : Float = 1.0

Const AL_EQUALIZER_MIN_LOW_CUTOFF                        : Float = 50.0, ..
      AL_EQUALIZER_MAX_LOW_CUTOFF                        : Float = 800.0, ..
      AL_EQUALIZER_DEFAULT_LOW_CUTOFF                    : Float = 200.0

Const AL_EQUALIZER_MIN_MID1_GAIN                         : Float = 0.126, ..
      AL_EQUALIZER_MAX_MID1_GAIN                         : Float = 7.943, ..
      AL_EQUALIZER_DEFAULT_MID1_GAIN                     : Float = 1.0

Const AL_EQUALIZER_MIN_MID1_CENTER                       : Float = 200.0, ..
      AL_EQUALIZER_MAX_MID1_CENTER                       : Float = 3000.0, ..
      AL_EQUALIZER_DEFAULT_MID1_CENTER                   : Float = 500.0

Const AL_EQUALIZER_MIN_MID1_WIDTH                        : Float = 0.01, ..
      AL_EQUALIZER_MAX_MID1_WIDTH                        : Float = 1.0, ..
      AL_EQUALIZER_DEFAULT_MID1_WIDTH                    : Float = 1.0

Const AL_EQUALIZER_MIN_MID2_GAIN                         : Float = 0.126, ..
      AL_EQUALIZER_MAX_MID2_GAIN                         : Float = 7.943, ..
      AL_EQUALIZER_DEFAULT_MID2_GAIN                     : Float = 1.0

Const AL_EQUALIZER_MIN_MID2_CENTER                       : Float = 1000.0, ..
      AL_EQUALIZER_MAX_MID2_CENTER                       : Float = 8000.0, ..
      AL_EQUALIZER_DEFAULT_MID2_CENTER                   : Float = 3000.0

Const AL_EQUALIZER_MIN_MID2_WIDTH                        : Float = 0.01, ..
      AL_EQUALIZER_MAX_MID2_WIDTH                        : Float = 1.0, ..
      AL_EQUALIZER_DEFAULT_MID2_WIDTH                    : Float = 1.0

Const AL_EQUALIZER_MIN_HIGH_GAIN                         : Float = 0.126, ..
      AL_EQUALIZER_MAX_HIGH_GAIN                         : Float = 7.943, ..
      AL_EQUALIZER_DEFAULT_HIGH_GAIN                     : Float = 1.0

Const AL_EQUALIZER_MIN_HIGH_CUTOFF                       : Float = 4000.0, ..
      AL_EQUALIZER_MAX_HIGH_CUTOFF                       : Float = 16000.0, ..
      AL_EQUALIZER_DEFAULT_HIGH_CUTOFF                   : Float = 6000.0
