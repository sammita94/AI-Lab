%Best first search main method
clc;
clear all;
close all;
edgeList = [1 2;1 3; 2 4; 2 5; 3 6; 3 7];
g = [0 1 1 2 2 1 2];
h = [2 0 1 4 4 0 2];
vertices = unique(edgeList);
v = numel(vertices);
visited = false(1,v);
path = [];
flag = 0;
target = 6;
queue = PriorityQueue();
[flag,path] = Astar(1,visited,path,h,g,edgeList,queue,target,flag);
if(flag==1)
    path
else
    S = sprintf('Not found!');
    disp(S)
end
