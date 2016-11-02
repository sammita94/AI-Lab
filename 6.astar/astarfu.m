function [path,flag,pq] = astarfu(v,nodeIDList,path,conncomp,target,flag,g,h,queue)
     if(flag == 1)
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
            push(queue,h(connectedNodes(i))+g(connectedNodes(i)),connectedNodes(i));
            connectedNodes(i)
         end
         next = pop(queue);
         next
         [path,flag,pq]=astarfu(next,nodeIDList,path,conncomp,target,flag,g,h,queue);
         
     end
end