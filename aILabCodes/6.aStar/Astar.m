function [ flag,path ] = Astar( node,visited,path,h,g,edgeList,queue,target,flag )
if(flag==1)
    return;
end
if(~visited(node))
    visited(node) = true;
    path = [path,node];
    if(node==target)
        flag = 1;
        return;
    end
    connectedComp = edgeList(edgeList(:,1)==node,2);
    for i =1:numel(connectedComp)
        push(queue,h(connectedComp(i))+g(connectedComp(i)),connectedComp(i));
    end
    next = pop(queue);
    [flag, path] = Astar(next,visited,path,h,g,edgeList,queue,target,flag);
end

end

