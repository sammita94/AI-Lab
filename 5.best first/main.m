clc;
clear all;
close all;
conncomp=[1 2;1 3; 2 4; 2 5; 3 6; 3 7];

heuristic = [2,2,1,3,3,0,2];
        
nodeIDs = unique(conncomp(:)); 
path = [];
nodeIDList = false(1,numel(nodeIDs));
clusterList = {};

counter = 1;

flag = 0;
list = [];

target = 6;

openQueue = PriorityQueue;

[path,flag] = best_first_search(1,nodeIDList,path,conncomp,target,flag,heuristic,openQueue);

if(flag == 1)
    path
else
    S = sprintf('Not found');
    disp(S);
end
