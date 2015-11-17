function print_results_latex(filename, inDir, outDir, combineTables, printClassNum)

load([inDir '/' filename]);

RawAlgName = {...
    'ARA\_All\_mean\_noClDiag\_Diag';...
    'ARA\_All\_CTS\_mean\_noClDiag\_Diag';...
    'Borda';...
    'MCLA';...
    'CSPA';...
    'HGPA';...
    'CVote';...
    'Vote';...
    'FutureTransfer';...
    'Bayes';...
    'LinkClueCTS';...
    'LinkClueSRS';...
    };
CleanAlgName = {...
    'ARA\\textsuperscript{Cons}';...
    'ARA\\textsuperscript{CTS}';...
    'Borda';...
    'MCLA';...
    'CSPA';...
    'HGPA';...
    'CVote';...
    'Vote';...
    'FutureTransfer';...
    'Bayes';...
    'LinkClueCTS';...
    'LinkClueSRS';...
    };

%% Options
if exist('printClassNum', 'var')
    printClassNum = 1;
end

%% Reshaping results
s = size(Results);
Results = reshape([Results{:}], s);

%% Calculating ARI
numAlgs = size(ConsFuncList, 1);
if combineTables
    avAri = NaN(1, numAlgs);
    stdAri = NaN(1, numAlgs);
    avClustNum = NaN(1, numAlgs);
    stdClustNum = NaN(1, numAlgs);
    for iAlg = 1:numAlgs
        avAri(1, iAlg) = mean([Results(:,iAlg).ari]);
        stdAri(1, iAlg) = std([Results(:,iAlg).ari]);
        avClustNum(1, iAlg) = mean([Results(:,iAlg).cclNum]);
        stdClustNum(1, iAlg) = std([Results(:,iAlg).cclNum]);
    end
else
    avAri = arrayfun(@(x) mean(x.ari), Results);
    stdAri = arrayfun(@(x) std(x.ari), Results);
    avClustNum = arrayfun(@(x) mean(x.cclNum), Results);
    stdClustNum= arrayfun(@(x) std(x.cclNum), Results);
end
%% Now, lets try to make tables


if combineTables
   numData = 1;
else
   numData = size(Results, 1);
end
AlgNames = cell(numAlgs, 1);
for iAlg = 1:numAlgs
   AlgNames(iAlg) = CleanAlgName(strcmp(ConsFuncList{iAlg,1}, RawAlgName));
end

%%
header = [...
'\\begin{table}[!h]\n',...
'\t\\tiny\n',...
'\t\\centering\n',...
'\t\t\\begin{tabular}{|l||c|', repmat('c|', 1, numAlgs), '}\n',...
'\t\t\\hline\n',...
'~ & ~', sprintf(' & %s', AlgNames{:}), '\\\\ \\hline \\hline \n';...
];

bodyAll = '';
for iData = 1:numData
    body = sprintf('\\t\\t\\\\multirow{2}{*}{%s}  & ARI ', DatasetList{iData, 1});
    for iAlg = 1:numAlgs
        body = [body, sprintf(' & $\\\\underset{(%1.3f)}{%1.3f}$', stdAri(iData, iAlg), avAri(iData, iAlg))];
    end
    if printClassNum
        body = [body, '\\\\'];
        body = [body, sprintf('\\\\cline{2-%d}', numAlgs+2)];
        body = [body, '\n \t\t & \\# clusters'];
        for iAlg = 1:numAlgs
            body = [body, sprintf('\\t\\t & $\\\\underset{(%2.3f)}{%2.3f}$', stdClustNum(iData, iAlg), avClustNum(iData, iAlg))];
        end
    end
    body = [body, '\\\\ \\hline\\hline \n'];
    
    bodyAll = [bodyAll, body];
end   

tail = [...
    '\t\t\\end{tabular}\n',...
    '\t\\caption{Experimental results on generated datasets}\n',...
    '\\end{table}',...
    ];

table = [header, bodyAll, tail];

%% Printing
outFileName = [outDir '/' filename(1:end-4)];
if printClassNum == 0;
    outFileName = [outFileName '_noClass'];
end
if combineTables
    outFileName = [outFileName '_combined'];
end
outFileName = [outFileName '.txt'];
fout = fopen(outFileName, 'w');
fprintf(fout, table);
fclose(fout);