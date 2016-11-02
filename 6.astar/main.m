conncomp=[1 2;1 3; 2 4; 2 5; 3 6; 3 7];
        
nodeIDs = unique(conncomp(:)); 
path = [];
list = [];
nodeIDList = false(1,numel(nodeIDs));
clusterList = {};

g = [0 1 1 2 2 1 2];
h = [2 0 1 4 4 0 2];

openQueue = PriorityQueue();
ntarget = 6;

[list,flag] = astarfu(1,nodeIDList,list,conncomp,ntarget,flag,g,h,openQueue);

if(flag == 1)
    list
else
    S = sprintf('Not found');
    disp(S);
end
