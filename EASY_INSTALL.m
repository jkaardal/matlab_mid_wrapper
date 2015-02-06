%% EASY INSTALL

cd mid/mid/mxml-2.6/

system('make', '-echo');
system('make install', '-echo');
cd ../..

cd mid

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

system('rm Makefile', '-echo');
system('cp tempmake Makefile', '-echo');
system('rm tempmake', '-echo');

system('make', '-echo');
system('make clean', '-echo');

cd ../..

system('mkdir Results');
system('mkdir XMLparams');
system('mkdir shell_scripts');
