function [path,flag,queue] = bfs(nodeIDList,path,conncomp,target,flag,queue)
    v = 0;
    if (numel(queue) != 0)
        v = queue(1);
        queue = queue(2:length(queue));
        if (~nodeIDList(v))
            nodeIDList(v) = true;
        path = [path,v];
        if(v == target)
            flag = 1;
        return;
        end
        connectedNodes = conncomp(conncomp(:,1) == v, 2);
        for idx =1:numel(connectedNodes)
             queue = [queue,connectedNodes(idx)];
        end
    else
        return ;
    end
    [path,flag,queue] = bfs(nodeIDList,path,conncomp,target,flag,queue);
end
