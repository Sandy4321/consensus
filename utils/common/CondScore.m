function CS = CondScore(cl1,cl2)
ConTable=crosstab(cl1,cl2); % ������� �������������
na=sum(ConTable,2); % ����� ��������� �� �������. ������������� ������� ��������� � crosstab
nb=sum(ConTable,1); % ����� ��������� �� ��������. ������������� ������� ��������� � crosstab

[numa, numb]=size(ConTable);
n=size(cl1,1);


CS=0;
for i=1:numa
    for j=1:numb
        CS=CS+ConTable(i,j)./nb(j).*ConTable(i,j)./n;
    end
end

end