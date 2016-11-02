conncomp=[1 2;1 3; 2 4; 2 5; 3 6; 3 7];
        
nodeIDs = unique(conncomp(:)); 
path = [];
list = [];
nodeIDList = false(1,numel(nodeIDs));
clusterList = {};

g = [0 1 1 2 2 1 2];

counter = 1;

flag = 0;
h = [];

target = 7;
[path,flag] = dfs(1,nodeIDList,path,conncomp,target,flag);

ntarget = 6;

for idx =1:numel(path)
    if path(idx) == ntarget
        hpos = idx;
        break;
    end
end

for idx =1:numel(path)
    h(idx) = abs(hpos-idx)*(idx);
end

flag =0;
[list,flag] = astarfu(1,nodeIDList,list,conncomp,ntarget,flag,g,h);
list


conncomp=[1 2;1 3; 2 4; 2 5; 3 6; 3 7];
        
nodeIDs = unique(conncomp(:)); 
path = [];
list = [];
nodeIDList = false(1,numel(nodeIDs));
clusterList = {};

g = [0 1 1 2 2 1 2];

counter = 1;

flag = 0;
h = [];

target = 6;
count = 0;
[h,count] = moddfs(1,nodeIDList,h,conncomp,target);

ntarget = 6;

h
%for idx =1:numel(path)
   % if path(idx) == ntarget
    %    hpos = idx;
     %   break;
    %end
%end

for idx =1:numel(path)
    h(path(idx)) = abs(hpos-idx)*(idx);
end

flag =0;
[list,flag] = astarfu(1,nodeIDList,list,conncomp,ntarget,flag,g,h);
list




def A*-TREE-SEARCH (start):
  Let pq be an empty min priority queue
  
  g(start) = 0
  f(start) = h(start)
  path(start) = []
  pq.push(start, f(start))
  
  while not pq.empty():
    top = pq.pop()
    if isGoal(top):
      return f(top), path(top)
    foreach next in succ(top):
      g(next) = g(top) + cost(top, next)
      f(next) = g(next) + h(next)
      path(next) = path(top).append(next)
      pq.push(next, f(next))
      
      
      
      A* is an informed search algorithm. At each iteration of its main loop, A* needs to determine which of its partial paths to expand into one or more longer paths. It does so based on an estimate of the cost (total weight) still to go to the goal node. Specifically, A* selects the path that minimizes
		f(n)=g(n)+h(n)
where n is the last node on the path, g(n) is the cost of the path from the start node to n, and h(n) is a heuristic that estimates the cost of the cheapest path from n to the goal. The heuristic is problem-specific. Typical implementations of A* use a priority queue to perform the repeated selection of minimum (estimated) cost nodes to expand. This priority queue is known as the open set or fringe. At each step of the algorithm, the node with the lowest f(x) value is removed from the queue, the f and g values of its neighbors are updated accordingly, and these neighbors are added to the queue. The algorithm continues until a goal node has a lower f value than any node in the queue (or until the queue is empty).
