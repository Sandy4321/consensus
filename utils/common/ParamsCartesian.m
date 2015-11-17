function ParamsVariants = ParamsCartesian(Params,MakeCells)
% Makes a cartesian product of "params" variants, where params are
% represented as a structure
%
%Input
% Params[struct] - the structure of the same format as one "params" unit,
% with actual values replaced by cell arrays of variants for this value, e.g.
% Params.ForecastRateParams.WeightParam = {0.15, 0.05, 0.005}; % ������� �����������
% Params.ForecastRateParams.KPTPeriodParams = [0 90 180]; % ������ (� ����), �� ������� ������� ������� ��� ���������� ��� �� �������
% Params.ForecastRateParams.SmoothParam = 11; % �������� ���������� �����������
% Params.SeasonalityParams.UseSeasonality = {0,1,2}; % ��������, ���������� �� ����� ����������
% Params.SeasonalityParams.TrendParam = 0.999; % �������� ����������� ������
% Params.SeasonalityParams.TheilWageParam = {[0.1,0.9,0.9,1],[0.1,0.9,1,1]}; % ��������� ��������� �����-������
% Params.FindIssuesParams.IssNumParam = 10; % ����������� ���������� ������� ��������
% Params.FindIssuesParams.IssDateParam = 30; % ��������, ���������� �� ��, � ����� ��������� ��� �������������� ����� ������� ��������
% Params.FindIssuesParams.IssDateStepParam = 30; % ��������, ���������� �� ��, ��� ����������� �������� ��� ��� ������ ������� ��������
% Params.FindIssuesParams.IssTimeParam = 60; % ��������, ���������� �� ��, ��������� ����� ���������� ����� ������ �������� ��� ������ ������� ��������
% Params.FindIssuesParams.WeekDayParam = {[0 0 0 0 0 1 1],[0 0 0 0 1 2 3]};
%
% MakeCells[bool] - make it true if params are not all numbers (like strings, handles etc)
%Output
% ParamsVariants[Nx1 struct] - all combinations of the variants given,
% each struct in the array is an actual structure of the parameters
%
%See also
% ParamStruct2Vec, ParamVec2Struct

[CartesianCell ParamsLegend] = ParamStruct2Vec(Params,1);
if ~exist('MakeCells','var')
    MakeCells = 1;
end
CartProd = CartesianProduct2CellArr(CartesianCell,1,MakeCells);
numProd = length(CartProd);
ParamsVariants = ParamVec2Struct(CartProd{1},ParamsLegend);
for k=2:numProd
    ParamsVariants(end+1) = ParamVec2Struct(CartProd{k},ParamsLegend);
end

end