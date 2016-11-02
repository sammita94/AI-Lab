function [path,flag] = dfs(v,nodeIDList,path,conncomp,target,flag)
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
         for idx =1:numel(connectedNodes)
             [path,flag] = dfs(connectedNodes(idx),nodeIDList,path,conncomp,target,flag);
         end
     end
end
