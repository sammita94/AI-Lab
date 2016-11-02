clc;
clear all;
close all;

conncomp=[1 2;1 3; 2 4; 2 5; 3 6; 3 7];
nodeIDs = unique(conncomp(:)); 
path = [];
nodeIDList = false(1,numel(nodeIDs));

flag = 0;
target = 3;

[path,flag] = dfs(1,nodeIDList,path,conncomp,target,flag);

if(flag == 1)
    path
else
    S = sprintf('Not found');
    disp(S);
end
