function ExperimentSchemesParams = GetExperSchemeParams(varargin)
% Function Build Parameter Structure for Experiments
% ExperimentSchemesParams
%   * FillOption - option for parameters for each dataset (string)
%   * SrsFunc - cell-array of cell-arrays of ensamble source functions (string or
%   handle)
%   * SrsFuncParams - cell-array of cell-arrays of parameters for source functions
%   * EnsembleSize - number of produced partitions per each source function
%   (cell-array of double-arrays)
%   * ExperimentsNum - number of experiments performed on each dataset
%   (double array)

ExperimentSchemesParams.FillOption = 'unique';
ExperimentSchemesParams.SrcFuncs = {...
    {@mwkmeansEnsamble;};...
    {@mwkmeansEnsamble;};...
    {@mwkmeansEnsamble;};...
    {@mwkmeansEnsamble;};...
    {@mwkmeansEnsamble;};...
    };
ExperimentSchemesParams.SrcFuncsParams = {...
    {struct('k', 5, 'Beta', 2, 'InitialCentroids', false, 'InitialW', false, 'p', 2);};...
    {struct('k', 5, 'Beta', 2, 'InitialCentroids', false, 'InitialW', false, 'p', 2);};...
    {struct('k', 5, 'Beta', 2, 'InitialCentroids', false, 'InitialW', false, 'p', 2);};...
    {struct('k', 5, 'Beta', 2, 'InitialCentroids', false, 'InitialW', false, 'p', 2);};...
    {struct('k', 5, 'Beta', 2, 'InitialCentroids', false, 'InitialW', false, 'p', 2);};...
    };
ExperimentSchemesParams.EnsembleSize = {...
    [100;];...
    [100;];...
    [100;];...
    [100;];...
    [100;];...
    };
ExperimentSchemesParams.ExperimentsNum = [...
    20;...
    20;...
    20;...
    20;...
    20;...
    ];
ExperimentSchemesParams.AriLowerThreshold = [...
    0.0;...
    0.0;...    
    0.0;...
    0.0;...
    0.0;...
    ];
ExperimentSchemesParams.AriUpperThreshold = [...
    1.0;...
    1.0;...
    1.0;...
    1.0;...
    1.0;...
    ];