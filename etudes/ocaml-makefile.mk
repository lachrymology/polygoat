#######################  Mandatory User's variables  #####################
#
# The Caml sources (including camlyacc and camllex source files)

SOURCES = syntaxe.ml grammaire.mly  lexeur.mll \
        print.ml eval.ml machine.ml compile.ml main.ml

EXEC = bar

########################## Optional user's variables #####################
#
# The list of Caml libraries needed by the program
# For instance:
# LIBS=$(GRAPHICS) $(UNIX) $(STR) $(NUMS) $(THREADS) $(DBM)

# Should be set to -custom if you use any of the libraries above
# or if any C code have to be linked with your program
# (irrelevant for ocamlopt)
# CUSTOM=-custom

########################## Include the template here #####################
include ~/lib/Makefile.ocaml
##########################  Continue  customization  #####################


# The Caml compilers.
# You may fix here the path to access the Caml compiler on your machine
# You may also have to add various -I options.

CAMLC = ocamlc -g etude.ml

# CAMLOPT = ocamlopt
# CAMLDEP = ocamldep
# CAMLLEX = ocamllex
# CAMLYACC = ocamlyacc