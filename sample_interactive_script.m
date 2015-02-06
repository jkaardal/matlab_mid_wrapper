%% Sample script for running mid interactively

addpath('./MATLAB_functions/');

% Stimulus format: binary file of type double or unsigned integer
stimname = './mid-demo/walk1_ieee_128x128x16384.raw';
stim_properties = struct( ...
    'dataType', 1, ...            % 1 for integer; 2 for double
    'width', 128, ...             % Number of bins along the x-axis
    'height', 128, ...            % Number of bins along the y-axis
    'xOffset', 5, ...             % x-axis bin offset of patch of stimulus bins relevant to spiking; no offset is 0
    'yOffset', 5, ...             % y-axis bin offset of patch of stimulus bins relevant to spiking; no offset is 0
    'patchWidth', 64, ...         % Number of bins along the x-axis of the stimulus patch relevant to spiking
    'patchHeight', 64, ...        % Number of bins along the y-axis of the stimulus patch relevant to spiking
    'xDs', 4, ...                 % Downsampling denominator along the x-axis
    'yDs', 4 ...                  % Downsampling denominator along the y-axis
);

% Response format: text file with a list of the number of spikes per bin
respname = './mid-demo/11101_1.isk';
Ntrials = 0;      % Number of response bins (should equal the number of stimuli)
Nlags = 3;        % Number of stimuli relevant to each spike
skipFrames = 0;   % Number of frames to skip to line up spikes with stimuli
part = 1;         % Portion of stimuli/responses to fit up to fit_options.Nparts(= 4 usually)

% Output prefix
prefix = 'V1model';

% nd is the dimensionality of the space being fit; cannot exceed 2 or 3
nd = 1;

% Fitting parameters (only change if you have to)
fit_options = struct( ...
    'Nparts', 4, ...               % Number of training sets/test sets to split the data into
    'maxIts', 1, ...               % Maximum annealing iterations
    'startTemp', 0.01, ...         % Start temperature
    'stopTemp', 1.0E-5, ...        % Stop temperature
    'schedule', 0.95, ...          % Down temperature factor
    'jumpFactor', 5.0, ...         % Up temperature factor
    'fTol', 5.0E-5, ...            % Function tolerance
    'updateFactor', 100, ...       % Update factor
    'numBins', '5,10,15', ...      % Number of information bins
    'numIts', '500,500,500' ...    % Number of interations at each numBins
);

run_mid_interactive(stimname, stim_properties, respname, Ntrials, Nlags, skipFrames, fit_options, prefix, nd, part)
