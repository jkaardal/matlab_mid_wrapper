# mid_matlab_wrapper
Maximally Informative Dimensions wrapper in MATLAB

------------------------------------------------------------------------------
INTRODUCTION
------------------------------------------------------------------------------

Contained in this README is information on how to install and use the MATLAB
Maximally Informative Dimensions (MID) code wrapper. This is called a
"wrapper" because the MID code itself is written in C with parameter values
defined in XML. This wrapper allows users more familiar with MATLAB to use
the MID code without having to touch the raw MID code.


------------------------------------------------------------------------------
INSTALLATION INSTRUCTIONS
------------------------------------------------------------------------------

1) Unarchive the file "matlab_mid_wrapper.tar" in your preferred directory. 
   This will produce a new directory called "matlab_mid_wrapper". Make sure
   all the files listed in the below manifest are present in the correct 
   folders. 

   MANIFEST:
      ./matlab_mid_wrapper/README.txt
      ./matlab_mid_wrapper/EASY_DOWNLOAD.m
      ./matlab_mid_wrapper/EASY_INSTALL.m
      ./matlab_mid_wrapper/organize.m
      ./matlab_mid_wrapper/submit_jobs.py
      ./matlab_mid_wrapper/sample_interactive_script.m
      ./matlab_mid_wrapper/sample_cluster_script.m
      ./matlab_mid_wrapper/MATLAB_functions/generate_xml_mid.m
      ./matlab_mid_wrapper/MATLAB_functions/prepare_mid_for_cluster.m
      ./matlab_mid_wrapper/MATLAB_functions/run_mid_interactive.m

Note: The "matlab_mid_wrapper" directory does not contain all the necessary 
files yet to run MID. They must be downloaded from github. The following is 
instructions on how to acquire the remaining files. Follow the directions 
carefully as the directory structure is important to properly use this 
wrapper. 

2) If you do not have git already, download it from http://git-scm.com/download

From here there are two methods for downloading and installing the files. It
is recommended you use method A.

  ------------
  Method A
  ------------
  
  A3) Open MATLAB and change your working directory to "matlab_mid_wrapper".
      You must change to this directory, you cannot just add a path to it.

  A4) Run the script "EASY_DOWNLOAD.m". You will see download progress
      output in the MATLAB command window.

  A5) After all the files are downloaded, make sure there is a folder called
      "mid" in the "matlab_mid_wrapper" directory. Then run the script
      "EASY_INSTALL.m". This will show the compilation progress of the raw
      MID code.

  A6) When you stop seeing output from the compilation process in the
      MATLAB command window, check to make sure the word "error" hasn't
      appeared in the last few lines of output. If an error has occurred,
      the code has not been compiled and MID cannot be used until the
      error is fixed. Review the above steps.

  ------------
  Method B
  ------------

  B3) Open Unix/Linux terminal. Go to your "matlab_mid_wrapper" directory.

  B4) Get the code: git clone git://github.com/sharpee/mid.git mid

  B5) Get the demo (if you like): 
      git clone git://github.com/sharpee/mid-demo.git mid-demo

  B6) After all the files are downloaded, make sure there is a folder 
      called "mid" in the "matlab_mid_wrapper" directory.

  B7) If you do not have the mxml package on your system enter these
      commands:

        cd mid
        git submodule init
        git submodule update
        cd mid/mxml-2.6
        ./configure --prefix="$PWD"
        make
        make install
        cd ../..

  B8) Compile the MID code by entering the following commands:
        
        cd mid
        make
        make clean

That's it, the MID code is installed.


------------------------------------------------------------------------------
HOW TO USE MID
------------------------------------------------------------------------------

Refer to the two included sample scripts. 

The script "sample_interactive_script.m" runs interactively; i.e. MID is run 
on the computer that is invoking the script and output is shown in the MATLAB 
terminal. Running interactively is useful for testing and analyzing a small
number of data sets or in the absence of a cluster.

The other sample script, "sample_cluster_script.m" shows how to prepare 
shell scripts such that MID can be run simultaneously for multiple data sets
on a cluster. Each data set will be submitted to a computer on the cluster.
Running on a cluster is useful if you have many data sets to analyze. The code
submitted to the cluster runs entirely in C thus no MATLAB licenses are used.

To get started quickly, simply copy a sample script and reassign the
variables to the appropriate values for the data set(s) you would like to
analyze. Heed the warnings in the comments, particularly about changing
optimization parameters in the struct "fit_options". Then run the script.

If you are running an interactive script, this is all that needs to be done.

If you are running a cluster script, you must make a simple edit to the 
python script "submit_jobs.py". Make a list of the prefixes you used
when you prepared the data for submission; e.g. prefix = ['aud1', 'aud2']
for two data sets assigned the prefix 'aud1' and 'aud2'. Run this script
by entering "python submit_jobs.py" in the command terminal. This script
will submit the shell scripts to the cluster. Note that you can write a shell
script or a MATLAB script with the same functionality, but cluster submission
servers may not have MATLAB installed.

The output of the MID code are binary files with data type 'double' ending 
with something similar to "prefix-ND-n2-v1-p1.dat" containing the receptive field 
features. They will appear in the main directory "matlab_mid_wrapper". Since 
this can become rather messy, run the script "organize.m" to move these files 
to the "Results" subdirectory. "v1" means it is the first vector fit (up to 
the assigned variable "nd") while "p1" is the training set used (usually up to
4 unless reassigned) and "n2" indicates that a two dimensional feature space 
was found (the second vector being in "prefix-ND-n2-v2-p1.dat"). 
