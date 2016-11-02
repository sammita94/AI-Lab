function [path,flag] = best_first_search(v,nodeIDList,path,conncomp,target,flag,heuristic,queue)
     if(flag==1)
         return
     end
     if (~nodeIDList(v))
         nodeIDList(v) = true;
         path = [path,v];
         if(v == target)
             flag = 1;
             return;
         end
         connectedNodes = conncomp(conncomp(:,1) == v, 2);
         for i =1:numel(connectedNodes)
            push(queue,heuristic(connectedNodes(i)),connectedNodes(i));
         end
         next = pop(queue);
         %next
         [path,flag]=best_first_search(next,nodeIDList,path,conncomp,target,flag,heuristic,queue);
         
     end
end
