
%% Load graph data
fid = fopen('input.txt');
line12= fscanf(fid,'%d %d %d',5);
vertices= line12(1,1);
edges= line12(2,1);
and_edges = line12(3,1);
start_node = line12(4,1);
goal_node = line12(5,1);

rest_lines = textscan(fid,'%d %d');
rest_lines_mat= cell2mat(rest_lines);
heuristic= rest_lines_mat(1:vertices,:);
and_lines= rest_lines_mat(vertices+1: vertices+and_edges,:);
graph= rest_lines_mat(vertices+and_edges+1:length(rest_lines_mat),:);
fclose(fid);


and_mat= zeros(1,vertices);
heuristic_mat = zeros(1,vertices);


for j = 1:and_edges
    x= and_lines(j,1);
    y= and_lines(j,2);
    and_mat(1,x) = y;
    and_mat(1,y) = x;
end

for k=1:vertices
    x= heuristic(k,1);
    y= heuristic(k,2);
    heuristic_mat(1,x)=y;
end

%[val,heuristic_updated] = update_heuristic( graph, and_mat,vertices,edges,heuristic_mat,1);
path = [];

[path,flag] = sahc(graph,heuristic_updated,start_node,goal_node,vertices);


if(flag == 1)
    path
else
    S = sprintf('Not found');
    disp(S);
end



