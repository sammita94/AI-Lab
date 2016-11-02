function [path,flag] = sahc(graph,heuristic_mat,start_node,end_node,vertices)

change=1;
path = [];
while change    
    best_node_wt=1000;
    best_node=0;
    
    path = [path, start_node];
    
    if(start_node==end_node)
        flag=1;
        return;
    end
    
    connectedNodes = graph(graph(:,1) == start_node, 2);
    for i=1:numel(connectedNodes)
        p = connectedNodes(i);
        wt= heuristic_mat(1,p);
        if wt<best_node_wt
            best_node = p;
            best_node_wt = wt;
        end
    end
    if best_node>0
            start_node = best_node;
    else
        change=0;
    end
end

flag = 0;
    
end
