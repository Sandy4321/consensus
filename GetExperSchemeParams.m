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
    {@kmeansEnsamble;};...
    {@kmeansEnsamble;};...
    {@kmeansEnsamble;};...
    {@kmeansEnsamble;};...
    {@kmeansEnsamble;};...
    {@kmeansEnsamble;};...
    {@kmeansEnsamble;};...
    {@kmeansEnsamble;};...
    {@kmeansEnsamble;};...
    };
ExperimentSchemesParams.SrcFuncsParams = {...
    {struct('kmin', 7, 'kmax', 7);};...
    {struct('kmin', 7, 'kmax', 7);};...
    {struct('kmin', 7, 'kmax', 7);};...
    {struct('kmin', 7, 'kmax', 7);};...
    {struct('kmin', 7, 'kmax', 7);};...
    {struct('kmin', 2, 'kmax', 31);};...
    {struct('kmin', 2, 'kmax', 31);};...
    {struct('kmin', 2, 'kmax', 31);};...
    {struct('kmin', 2, 'kmax', 31);};...
    {struct('kmin', 2, 'kmax', 31);};...
    };
ExperimentSchemesParams.EnsembleSize = {...
    [30;];...
    [30;];...
    [30;];...
    [30;];...
    [30;];...
    [30;];...
    [30;];...
    [30;];...
    [30;];...
    [30;];...
    };
ExperimentSchemesParams.ExperimentsNum = [...
    20;...
    20;...
    20;...
    20;...
    20;...
    20;...
    20;...
    20;...
    20;...
    ];
ExperimentSchemesParams.AriLowerThreshold = [...
    0.2;...
    0.2;...
    0.2;...
    0.2;...
    0.2;...
    0.2;...
    0.2;...
    0.2;...
    ];
ExperimentSchemesParams.AriUpperThreshold = [...
    0.7;...
    0.7;...
    0.7;...
    0.7;...
    0.7;...
    0.7;...
    0.7;...
    0.7;...
    ];


% ExperimentSchemesParams.FillOption = 'unique';
% ExperimentSchemesParams.SrcFuncs = {...
%     {@noisePartitionEnsemble;};...
%     {@noisePartitionEnsemble;};...
%     {@noisePartitionEnsemble;};...
%     {@noisePartitionEnsemble;};...
%     {@noisePartitionEnsemble;};...
%     {@noisePartitionEnsemble;};...
%     {@noisePartitionEnsemble;};...
%     {@noisePartitionEnsemble;};...
%     {@noisePartitionEnsemble;};...
%     {@noisePartitionEnsemble;};...
%     {@noisePartitionEnsemble;};...
%     };
% ExperimentSchemesParams.SrcFuncsParams = {...
%     {struct('prob', 0.0, 'type', ['random']);};...
%     {struct('prob', 0.1, 'type', ['random']);};...
%     {struct('prob', 0.2, 'type', ['random']);};...
%     {struct('prob', 0.3, 'type', ['random']);};...
%     {struct('prob', 0.4, 'type', ['random']);};...
%     {struct('prob', 0.5, 'type', ['random']);};...
%     {struct('prob', 0.6, 'type', ['random']);};...
%     {struct('prob', 0.7, 'type', ['random']);};...
%     {struct('prob', 0.8, 'type', ['random']);};...
%     {struct('prob', 0.9, 'type', ['random']);};...
%     {struct('prob', 1, 'type', ['random']);};...
%     };
% ExperimentSchemesParams.EnsembleSize = {...
%     [30;];...
%     [30;];...
%     [30;];...
%     [30;];...
%     [30;];...
%     [30;];...
%     [30;];...
%     [30;];...
%     [30;];...
%     [30;];...
%     [30;];...
%     };
% ExperimentSchemesParams.ExperimentsNum = [...
%     20;...
%     20;...
%     20;...
%     20;...
%     20;...
%     20;...
%     20;...
%     20;...
%     20;...
%     20;...
%     20;...
%     ];
% ExperimentSchemesParams.AriLowerThreshold = [...
%     0.2;...
%     0.2;...
%     0.2;...
%     0.2;...
%     0.2;...
%     0.2;...
%     0.2;...
%     0.2;...
%     ];
% ExperimentSchemesParams.AriUpperThreshold = [...
%     0.7;...
%     0.7;...
%     0.7;...
%     0.7;...
%     0.7;...
%     0.7;...
%     0.7;...
%     0.7;...
%     ];