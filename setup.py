from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

import os
FLITE=os.environ["FLITE"]
FLITE_INCLUDE = FLITE+"/include"
FLITE_LIBDIR = FLITE+"/build/x86_64-linux-gnu/lib"

FLITE_2_LIBS = \
["flite",
"flite_cmu_grapheme_lang",
"flite_cmu_grapheme_lex",
"flite_cmu_indic_lang",
"flite_cmu_indic_lex",
"flite_cmulex",
"flite_cmu_time_awb",
"flite_cmu_us_awb",
"flite_cmu_us_kal16",
"flite_cmu_us_kal",
"flite_cmu_us_rms",
"flite_cmu_us_slt",
"flite_usenglish"]




FLITE_LIBS = FLITE_2_LIBS


extensions = [
    Extension("flite", ["flite.pyx",],
        include_dirs = ["src", FLITE_INCLUDE],
        define_macros = [],
        libraries = FLITE_LIBS,
        library_dirs = [FLITE_LIBDIR,],
        extra_objects = [FLITE+"/build/x86_64-linux-gnu/obj/src/wavesynth/cst_diphone.o", ],
    ),
]
setup(
    name = "flite",
    ext_modules = cythonize(extensions),
)
