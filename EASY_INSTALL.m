%% EASY INSTALL

origin = pwd;
mxml = [origin, '/mid/mid/mxml-2.6/'];

system(['cd ', mxml, '; make'], '-echo');
system(['cd ', mxml, '; make install'], '-echo');

mid = [origin, '/mid/mid/'];

cd mid/mid

% necessary to remove flag -fstrict (to be fixed in the future)
fid = fopen('Makefile', 'rt');
fid2 = fopen('tempmake', 'wt');
tl = fgets(fid);
while ischar(tl)
    ind = strfind(tl, '-fstrict');
    if ~isempty(ind)
        tl = [tl(1:ind-1) tl(ind+numel('-fstrict')+1:end)];
    end
    fprintf(fid2,'%s',tl);
    tl = fgets(fid);
end
fclose(fid);
fclose(fid2);

system(['cd ', mid, '; rm Makefile'], '-echo');
system(['cd ', mid, '; cp tempmake Makefile'], '-echo');
system(['cd ', mid, '; rm tempmake'], '-echo');

system(['cd ', mid, '; make'], '-echo');
system(['cd ', mid, '; make clean'], '-echo');

cd(origin)

system(['cd ', origin, '; mkdir Results']);
system(['cd ', origin, '; mkdir XMLparams']);
system(['cd ', origin, '; mkdir shell_scripts']);
