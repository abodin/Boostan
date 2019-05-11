
function [mindistIns, targetXEst] = mycode(param)

runNum = param.runNum;
Res    = zeros(runNum,4);
fval   = inf*ones(runNum,1);

optUpperBound = [param.Xmax ;param.Ymax ;param.P0Upper];

mindistIns = inf;

for i=1:runNum
    
    fvalTemp = fval;
    sortfval = sort(fvalTemp);
   
end % End for i




