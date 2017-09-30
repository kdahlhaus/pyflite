cdef extern from "stdio.h":
    cdef extern void printf(...)

cdef extern from "flite.h":

    cdef struct cst_voice:
        pass

    cdef extern void flite_init()
    cdef extern cst_voice *register_cmu_us_rms()
    cdef extern void  unregister_cmu_us_rms(cst_voice *voice)
    cdef extern cst_voice *register_cmu_us_slt()
    cdef extern void  unregister_cmu_us_slt(cst_voice *voice)
    cdef extern float flite_text_to_speech(char *text, cst_voice *voice, char *outtype)
    cdef extern float flite_file_to_speech(char *fileName, cst_voice *voice, char *outtype)
    cdef extern float flite_ssml_text_to_speech(const char *text, cst_voice *voice, const char *outtype)


cdef float say_imp( char *text, char *voiceName,  char *fileName):
    cdef cst_voice *voice

    if (voiceName=="rms".encode()):
        voice = register_cmu_us_rms()
    elif (voiceName=="slt".encode()):
        voice = register_cmu_us_slt()


    cdef void (*unregfunc)(cst_voice *)

    seconds = flite_text_to_speech( text, voice, fileName)

    if (voiceName=="rms".encode()):
        unregister_cmu_us_rms(voice)
    elif (voiceName=="slt".encode()):
        unregister_cmu_us_slt(voice)

    return seconds

cdef float say_ssml_imp( char *text, char *voiceName,  char *fileName):
    cdef cst_voice *voice

    if (voiceName=="rms".encode()):
        voice = register_cmu_us_rms()
    elif (voiceName=="slt".encode()):
        voice = register_cmu_us_slt()


    cdef void (*unregfunc)(cst_voice *)

    seconds = flite_ssml_text_to_speech( text, voice, fileName)

    if (voiceName=="rms".encode()):
        unregister_cmu_us_rms(voice)
    elif (voiceName=="slt".encode()):
        unregister_cmu_us_slt(voice)

    return seconds
 



cdef float sayFile_imp( char *srcFileName, char *fileName):
    cdef cst_voice *voice
    voice = register_cmu_us_rms()
    seconds = flite_file_to_speech( srcFileName, voice, fileName)
    unregister_cmu_us_rms(voice)
    return seconds

    



def init():
    """This must be called before any other flite function can be called."""
    flite_init()

def say( text, fileName="play", voice="rms" ):
    """ say( text [, fileName]): text = text to speak, if fileName is given, writes wav output to that file, returns number of seconds of speech generated """
    return say_imp(text.encode(), voice.encode(), fileName.encode())

def say_ssml( text, fileName="play", voice="rms" ):
    """ say_ssml( text [, fileName]): text = text to speak, if fileName is given, writes wav output to that file, returns number of seconds of speech generated """
    return say_ssml_imp( text.encode(), voice.encode(), fileName.encode())

def sayFile( srcFileName, fileName="play"):
    """ sayFile( srcFileName [, fileName]): srcFileName = file to speak, if fileName is given, writes wav output to that file, returns number of seconds of speech generated """
    return sayFile_imp(srcFileName.encode(), fileName.encode())
