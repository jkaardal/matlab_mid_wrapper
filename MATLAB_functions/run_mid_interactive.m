function run_mid_interactive(stimname, stim_properties, respname, Ntrials, Nlags, skipFrames, fit_options, prefix, nd, part)
    
    generate_xml_mid(stimname, stim_properties, respname, Ntrials, Nlags, skipFrames, fit_options, prefix);
    
    if nd == 1
        system(['./mid/mid/mid1d 1 ./XMLparams/pxml_' prefix '.xml ' int2str(part)], '-echo');
    elseif nd == 2
        system(['./mid/mid/midnd ' int2str(nd) ' ./XMLparams/pxml_' prefix '.xml ' int2str(part)], '-echo');
    elseif nd > 2
        fprintf('WARNING: choosing nd > 2 can take VERY long to fit.\n');
        system(['./mid/mid/midnd ' int2str(nd) ' ./XMLparams/pxml_' prefix '.xml ' int2str(part)], '-echo');
    else
        fprintf('Invalid number of dimensions nd = %d !\n', nd);
        fprintf('nd must be greater than or equal to one (though 3 or more is SLOW).\n');
        fprintf('Paused...Hit enter to continue.\n');
        pause;
    end
    
end
