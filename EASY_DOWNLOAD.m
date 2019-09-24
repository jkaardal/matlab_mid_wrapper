%% EASY DOWNLOAD

origin = pwd;
system(['cd ',origin,'; git clone git://github.com/sharpee/mid.git mid'], '-echo');

% remove this line if you do not want demo
system(['cd ', origin, '; git clone git://github.com/sharpee/mid-demo.git mid-demo'], '-echo');

middir = [origin,'/mid'];
system(['cd ', middir, '; git submodule init'], '-echo');
system(['cd ', middir, '; git submodule update'], '-echo');
mxml = [origin,'/mid/mid/mxml-2.6'];
system(['cd ', mxml,'; ./configure --prefix="$PWD"'], '-echo');

