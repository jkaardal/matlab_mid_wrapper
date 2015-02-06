function generate_xml_mid(stimname, stim_properties, respname, Ntrials, Nlags, skipFrames, fit_options, prefix) 

    fid = fopen(['./XMLparams/pxml_' prefix '.xml'], 'wt');
    
    fprintf(fid, '<?xml version="1.0" encoding="utf-8"?>\n');
    fprintf(fid, '<Configuration>\n');
    fprintf(fid, '  <ParametersGroup name="Spike Parameters">\n');
    fprintf(fid, '    <StringListParameter name="spike files" value="%s"/>\n', respname);
    fprintf(fid, '    <IntegerParameter name="number of parts" value="%d"/>\n', fit_options.Nparts);
    fprintf(fid, '    <IntegerParameter name="number of trials" value="%d"/>\n', Ntrials);
    fprintf(fid, '  </ParametersGroup>\n');
    fprintf(fid, '\n');
    fprintf(fid, '  <ParametersGroup name="Annealing Parameters">\n');
    fprintf(fid, '    <IntegerParameter name="max annealing iterations" value="%d"/>\n', fit_options.maxIts);
    fprintf(fid, '    <DoubleParameter name="start temperature" value="%f"/>\n', fit_options.startTemp);
    fprintf(fid, '    <DoubleParameter name="stop temperature" value="%f"/>\n', fit_options.stopTemp);
    fprintf(fid, '    <DoubleParameter name="down temperature factor" value="%f"/>\n', fit_options.schedule);
    fprintf(fid, '    <DoubleParameter name="up temperature factor" value="%f"/>\n', fit_options.jumpFactor);
    fprintf(fid, '    <DoubleParameter name="function tolerance" value="%f"/>\n', fit_options.fTol);
    fprintf(fid, '    <IntegerParameter name="updateFactor" value="%d"/>\n', fit_options.updateFactor);
    fprintf(fid, '  </ParametersGroup>\n');
    fprintf(fid, '\n');
    fprintf(fid, '  <ParametersGroup name="Movie Parameters">\n');
    fprintf(fid, '    <StringListParameter name="movie files" value="%s"/>\n', stimname);
    fprintf(fid, '    <EnumeratorParameter name="data type" value="%d" values="byte:1:double:2"/>\n', stim_properties.dataType);
    fprintf(fid, '\n');
    fprintf(fid, '    <IntegerParameter name="width" value="%d"/>\n', stim_properties.width);
    fprintf(fid, '    <!-- smallest legal value is one -->\n');
    fprintf(fid, '    <IntegerParameter name="x offset" value="%d"/>\n', stim_properties.xOffset);
    fprintf(fid, '    <IntegerParameter name="sta width" value="%d"/>\n', stim_properties.patchWidth);
    fprintf(fid, '    <IntegerParameter name="x downsample" value="%d"/>\n', stim_properties.xDs);
    fprintf(fid, '\n');
    fprintf(fid, '    <IntegerParameter name="height" value="%d"/>\n', stim_properties.height);
    fprintf(fid, '    <!-- smallest legal value is one -->\n');
    fprintf(fid, '    <IntegerParameter name="y offset" value="%d"/>\n', stim_properties.yOffset);
    fprintf(fid, '    <IntegerParameter name="sta height" value="%d"/>\n', stim_properties.patchHeight);
    fprintf(fid, '    <IntegerParameter name="y downsample" value="%d"/>\n', stim_properties.yDs);
    fprintf(fid, '\n');
    fprintf(fid, '    <IntegerParameter name="sta duration" value="%d"/>\n', Nlags);
    fprintf(fid, '    <!-- smallest legal value is zero -->');
    fprintf(fid, '    <IntegerParameter name="skipped sta frames" value="%d"/>\n', skipFrames);
    fprintf(fid, '    <IntegerListParameter name="number of bins" value="%s"/>\n', fit_options.numBins);
    fprintf(fid, '    <IntegerListParameter name="number of iterations" value="%s"/>\n', fit_options.numIts);
    fprintf(fid, '  </ParametersGroup>\n');
    fprintf(fid, '\n');
    fprintf(fid, '  <ParametersGroup name="Output Parameters">\n');
    fprintf(fid, '    <StringParameter name="prefix" value="%s"/>\n', prefix);
    fprintf(fid, '  </ParametersGroup>\n');
    fprintf(fid, '\n');
    fprintf(fid, '\n');
    fprintf(fid, '</Configuration>');
    
    fclose(fid);
    
end
