function prepare_mid_for_cluster(stimname, stim_properties, respname, Ntrials, Nlags, skipFrames, fit_options, prefix, nd, part)

    generate_xml_mid(stimname, stim_properties, respname, Ntrials, Nlags, skipFrames, fit_options, prefix);
    
    % Generate bash scripts
    fid = fopen(['./shell_scripts/' prefix '_cl.sh'], 'wt');
    
    fprintf(fid, '#!/bin/bash\n');
    fprintf(fid, '#$ -cwd\n');
    fprintf(fid, '#$ -N %s\n', [prefix '_cl']);
    fprintf(fid, '#$ -o %s\n', ['./shell_scripts/' prefix '_cl.txt']);
    fprintf(fid, '#$ -e %s\n', ['./shell_scripts/' prefix '_cl.txt']);
    fprintf(fid, '\n');
    if nd == 1
        fprintf(fid, './mid/mid/mid1d %d ./XMLparams/pxml_%s.xml %d', nd, prefix, part);
    elseif nd == 2
        fprintf(fid, './mid/mid/midnd %d ./XMLparams/pxml_%s.xml %d', nd, prefix, part);
    elseif nd > 2
        fprintf('WARNING: choosing nd > 2 can take VERY long to fit.\n');
        system(['./mid/mid/midnd ' int2str(nd) ' ./XMLparams/pxml_' prefix '.xml ' int2str(part)], '-echo');
    else
        fprintf('Invalid number of dimensions nd = %d !\n', nd);
        fprintf('nd must be greater than or equal to one (though 3 or more is SLOW).\n');
        fprintf('Paused...Hit enter to continue.\n');
        pause;
    end
    
    fclose(fid);
    
end
