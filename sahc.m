function found= sahc(adj_mat,heuristic_mat,start_node,end_node,vertices)

change=1;
while change    
    best_node_wt=1000;
    best_node=0;
    
    fprintf(1,'%d\n',start_node)
    
    if(start_node==end_node)
        found=1;
        return;
    end
    
    for i=1:vertices
        edge_present = adj_mat(start_node,i);
        if edge_present>0
            wt= heuristic_mat(1,i);
            if wt<best_node_wt
                best_node = i;
                best_node_wt = wt;
            end
        end
    end
    if best_node>0
            start_node = best_node;
    else
        change=0;
    end
end

found=0;
    
end
