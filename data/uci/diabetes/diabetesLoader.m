function [X, truth] = diabetesLoader(Params)
% Function loads diabetes dataset and perform standardization of format
% Input:
% Params - struct with parameters
%
% Output:
% X - [object x feature] matrix
% truth - cluster labels

% loading

X = load([Params.Dir 'pima-indians-diabetes.data']);

truth = X(:,end);
X(:,end) = [];
[n,v] = size(X);

%% Feature Standartization

% Centering
if(isfield(Params,'Centering') && Params.Centering)
    me = mean(X);
    X = X - repmat(me, n, 1);
end

% Normalization
if(isfield(Params,'Normalization') && Params.Normalization)
    st = std(X);
    X = X./repmat(st, n, 1);
end
