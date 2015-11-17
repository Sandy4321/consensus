function FuncList = BuildConsensusFuncsParams(X,RealLabels,A,P,Ensemble,Task4Experiment)
% ������� ��������� � �������������� ��������� ����������� ��������� ���
% ��������� ���������� � ����������� �� ������������ �������

[n,l] = size(Ensemble);

FuncList = Task4Experiment.ConsensusFuncs;

% ��������� ���������� �������� ��� ���������������
% ��� ������� A � � ������ ������ �� �����������!
if any(strncmpi(FuncList(:,2),'borda',5) | strncmpi(FuncList(:,2),'cond',4))
    Ref = Ensemble(:,1); % �������� ������
    RelabelEnsemble = BuildRelabeling(Ensemble,Ref);
end

for iFunc = 1:size(FuncList,1)
   eval(sprintf('FuncList{%d,3} = %s;',iFunc,FuncList{iFunc,3})); 
end

end