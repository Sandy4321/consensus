function [ParamVec ParamVecLegend] = ParamStruct2Vec(ParamStruct,DoubleCells)
% Converts the parameters structure into one vector. Is the opposite to
% ParamVec2Struct.
%
%Input
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
%DoubleCells [bool] - if true,the result is a cell array of cells. Needed
%for CartesianProduct2CellArr, ParamsCartesian
                   
%Output
%ParamVec[Nx1 cell]  the structure ParamStruct, serialized into a cell
%array 
%ParamVecLegend{Nx1} - the legend for the fields of the serialized structure

%See also
% ParamVec2Struct,CartesianProduct2CellArr,ParamsCartesian

if nargin < 2 || isempty(DoubleCells)
    DoubleCells = 1;
end

ParamVec = [];
ParamVecLegend = {};
if nargin < 1 || isempty(ParamStruct), return; end 
Fields = fieldnames(ParamStruct);
for i = 1:length(Fields)
    field = Fields{i};
    if isstruct(eval(['ParamStruct.' field]))
        eval(['[SubParamVec SubParamLegend] = ParamStruct2Vec(ParamStruct.' field ',DoubleCells);']);
        SubParamLegend = cellstr([repmat([field '.'],length(SubParamLegend),1) char(SubParamLegend(:)) ])';
        ParamVec = [ParamVec SubParamVec];
        ParamVecLegend = [ParamVecLegend SubParamLegend];
    else
        eval(['Param = ParamStruct.' field ';']);

        if DoubleCells
            if iscell(Param), ParamVec = [ParamVec {Param}];
            else ParamVec = [ParamVec {{Param}}]; end
        else
            if iscell(Param), ParamVec = [ParamVec Param];
            else ParamVec = [ParamVec {Param}]; end
        end
        
        % [Daniel, 16.07.2011] ������� ������������ ����� ��� ��������
        % ��������� � �������, ���� �������� ���� - ������.
        FieldLegend = cellstr(field)';
        
        ParamVecLegend = [ParamVecLegend FieldLegend];              
    end
end


end