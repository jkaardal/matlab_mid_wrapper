from subprocess import call
import os

# Use this script to submit mid jobs to a cluster
# Run the script by typing "python submit_jobs" in the terminal

# Enter a list of prefix(es) used with the matlab code prepare_mid_for_cluster.m (which prepares the shell script)
cellnums = list(range(1,2))
Nparts = 4

prefix = []
for cellnum in cellnums:
  for part in range(1, Nparts+1):
    prefix.append("V1model" + str(cellnum) + "-p" + str(part))




# Submission script should work without modification. 
# Add flags if necessary after "qsub" such as "-l mem_free=4G" for a job that requires at least 4 GB of RAM.
files = []
for p in prefix:
  files.append("./shell_scripts/" + str(p) + "_cl.sh")

for f in files:
  if os.path.isfile(f):
    call("qsub " + f, shell=True)
