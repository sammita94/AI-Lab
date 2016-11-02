function [h,heu] = update_heuristic( graph,and_mat,vertices,edges,heuristic_mat,current_node )

%check if the current node is a terminal one
child_present= false;
connectedNodes = graph(graph(:,1) == current_node, 2);

if(numel(connectedNodes) == 0)
    child_present = false;
else
    child_present = true;
end

if child_present==false
    heu= heuristic_mat;
    h= heuristic_mat(1,current_node);
    return;
end

val=1000;
for i=1:numel(connectedNodes)
    p = connectedNodes(i);
        %check if an AND arc is present and both of them has already been
        %processed
    if and_mat(1,p)>0 && and_mat(1,p) < p
        continue;
    end
    heuristic_mat(1,p) = update_heuristic( graph,and_mat,vertices,edges,heuristic_mat,p );
    if and_mat(1,p)>0
            %AND arc present
        heuristic_mat(1,and_mat(1,p))= update_heuristic( graph,and_mat,vertices,edges,heuristic_mat,and_mat(1,p));
        val = min(val, heuristic_mat(1,p)+heuristic_mat(1,and_mat(1,p)))+2;
    else
        val = min(val, heuristic_mat(1,p))+1;
    end
end


%fprintf(1,'current node updated to %d',val);
%update the current node's heuristic to the minimum value of the child
%nodes' heuristic
heuristic_mat(1,current_node)= val;
h= val;
heu=heuristic_mat;
end

