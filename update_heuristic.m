function [h,heu] = update_heuristic( adj_mat,and_mat,vertices,edges,heuristic_mat,current_node )

%check if the current node is a terminal one
child_present= false;
for i=1:vertices
    if adj_mat(current_node,i)==1
        child_present=true;
        break;
    end
end

if child_present==false
    heu= heuristic_mat;
    h= heuristic_mat(1,current_node);
    return;
end

val=1000;
for i=1:vertices
    if adj_mat(current_node,i)==1
        %check if an AND arc is present and both of them has already been
        %processed
        if and_mat(1,i)>0 && and_mat(1,i) < i
            continue;
        end
        heuristic_mat(1,i) = update_heuristic( adj_mat,and_mat,vertices,edges,heuristic_mat,i );
        if and_mat(1,i)>0
            %AND arc present
            heuristic_mat(1,and_mat(1,i))= update_heuristic( adj_mat,and_mat,vertices,edges,heuristic_mat,and_mat(1,i));
            val = min(val, heuristic_mat(1,i)+heuristic_mat(1,and_mat(1,i)))+2;
        else
            val = min(val, heuristic_mat(1,i))+1;
        end
    end
end
%fprintf(1,'current node updated to %d',val);
%update the current node's heuristic to the minimum value of the child
%nodes' heuristic
heuristic_mat(1,current_node)= val;
h= val;
heu=heuristic_mat;
end

