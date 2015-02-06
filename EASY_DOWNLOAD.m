%% EASY DOWNLOAD

system('git clone git://github.com/sharpee/mid.git mid', '-echo');

% remove this line if you do not want demo
system('git clone git://github.com/sharpee/mid-demo.git mid-demo', '-echo');

cd mid
system('git submodule init', '-echo');
system('git submodule update', '-echo');
cd mid/mxml-2.6
system('./configure --prefix="$PWD"', '-echo');
cd ../../..
