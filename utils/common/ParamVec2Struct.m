function ParamStruct = ParamVec2Struct(ParamVec,ParamVecLegend)
% Converts the parameters vector into structure. Is the opposite to
% ParamStruct2Vec.
%
%Input
% ParamVec[Nx1| Nx1 cell]  the structure ParamStruct, serialized into a vector
% ParamVecLegend{Nx1} - the legend for the fields of the serialized
% structure
%
%Output
% Params[struct] -  the structure of parameters. Structure might contain
% numbers, vectors of other structures
% Params.ForecastRateParams.WeightParam = 0.05; % ������� �����������
% Params.ForecastRateParams.KPTPeriodParams = KPTPeriodParams; % ������ (� ����), �� ������� ������� ������� ��� ���������� ��� �� �������
% Params.ForecastRateParams.SmoothParam = 11; % �������� ���������� �����������
% 
% Params.SeasonalityParams.UseSeasonality = 1; % ��������, ���������� �� ����� ����������
% % 0 - �� ������������ ���������� (� �������� ���������� ������������ ������� ���);
% % 1 - ������������ ���������� ������������������� ����������;
% % 2 - ���������� �� �������
% Params.SeasonalityParams.TrendParam = 0.999; % �������� ����������� ������
% Params.SeasonalityParams.TheilWageParam = [0.1,0.9,0.9,1]; % ��������� ��������� �����-������
% 
% Params.FindIssuesParams.IssNumParam = 10; % ����������� ���������� ������� ��������
% Params.FindIssuesParams.IssDateParam = 30; % ��������, ���������� �� ��, � ����� ��������� ��� �������������� ����� ������� ��������
% Params.FindIssuesParams.IssDateStepParam = 30; % ��������, ���������� �� ��, ��� ����������� �������� ��� ��� ������ ������� ��������
% Params.FindIssuesParams.IssTimeParam = 60; % ��������, ���������� �� ��, ��������� ����� ���������� ����� ������ �������� ��� ������ ������� ��������
% Params.FindIssuesParams.WeekDayParam = [0 0 0 0 1 2 3];
%
%See also
% ParamStruct2Vec

ParamStruct = [];
if nargin < 2 || isempty(ParamVec) || isempty(ParamVecLegend), return; end
VecLen = length(ParamVec);
if VecLen ~=length(ParamVecLegend), 
    error('ParamVec2Struct:IncorrectInput','The lengths of the vector and its legend are different!');
end


Params = unique(ParamVecLegend);
MakeCells = iscell(ParamVec);
for p=1:length(Params)
    param = Params{p};
    idx = strmatch(param,ParamVecLegend,'exact');
    % [Daniel, 16.07.2011] ����� ������� ��� �������� ���������� � cell-��
    if MakeCells
        eval(['ParamStruct.' param '= ParamVec{idx};']);
    else
        eval(['ParamStruct.' param '= ParamVec(idx);']);
    end


end
    


end