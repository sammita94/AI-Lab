function [h,count] = moddfs(v,nodeIDList,h,conncomp,target)
     if (~nodeIDList(v))
         nodeIDList(v) = true;
         if(v == target)
             count = 0;
             h(v) = count;
             return;
         end
         connectedNodes = conncomp(conncomp(:,1) == v, 2);
         for idx =1:numel(connectedNodes)
             [h,count] = moddfs(connectedNodes(idx),nodeIDList,h,conncomp,target);
             if(count != -1)
                h(v) = count + 1;
         end
         if(h(v) == -1)
            h(v) = 999;
     end
end
