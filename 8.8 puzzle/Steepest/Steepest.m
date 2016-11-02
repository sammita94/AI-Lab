function [  ] = Steepest( userInput , goalSt )
%SEARCHBESTMOVE search the best move
%   Use heuristics to find next move

	S.node = userInput;
	S.costh1 = 0;
	S.costh2 = 0;
	histList = S;
	path = S;
	pathy = 1;
	bestNodes = S;
	bestNodes(1).parentId = -1;
    lastOpen = 1;
	x = 0;
	nBest = 2;
	lastHist = 2;
    goalFound=0;
    id = 0;
	loops = 0;
	tic;
	fopen('myFile.txt','w');
	dlmwrite('myFile.txt',S.node,'-append',...
                        'delimiter',' ','roffset',1)
	
	while ~goalFound && pathy < 2000
	
		[h1,h2] = CostFunc (S.node , goalSt);
        if (h1)
            %find child nodes
            
            [line, col] = find (S.node == 0);
            
            %slide left to rigth
            if col > 1
                x = 1;
                list(x).node = S.node;
                list(x).node (line,col) =  S.node (line, col-1);
                list(x).node (line , col-1) = 0;
                [h1,h2] = CostFunc (list(x).node , goalSt);
                list(x).costh1 = h1;
                list(x).costh2 = h2;
            end
            %slide rigth to left    if col < 3
            if col < 3
                x = x + 1;
                list(x).node = S.node;
                list(x).node (line,col) =  S.node (line, col+1);
                list(x).node (line , col+1) = 0;
                [h1,h2] = CostFunc (list(x).node , goalSt);
                list(x).costh1 = h1;
                list(x).costh2 = h2;
            end
            %slide up to down
            if line > 1
                x = x + 1;
                list(x).node = S.node;
                list(x).node (line,col) = S.node (line-1, col);
                list(x).node (line-1,col) = 0;
                [h1,h2] = CostFunc (list(x).node , goalSt);
                list(x).costh1 = h1;
                list(x).costh2 = h2;
            end
            %slide down to up
            if line < 3
                x = x + 1;
                list(x).node = S.node;
                list(x).node (line,col) = S.node (line+1, col);
                list(x).node (line+1,col) = 0;
                [h1,h2] = CostFunc (list(x).node , goalSt);
                list(x).costh1 = h1;
                list(x).costh2 = h2;
			end
		    
		     %see if the goal node exists in the four moves
            [ind,temp] = size(list);
            while(temp>0)
                [ind , ran , v] = find (list(temp).node == goalSt);
                if sum(v)==9
                    pathy = pathy +1;
                    path(pathy) = list(temp);
                    dlmwrite('myFile.txt',list(temp).node,'-append',...
                        'delimiter',' ','roffset',1);
                    fprintf('No. of loops:%d\n',pathy);
                    fprintf('\nEND\n');
                    return
                    goalFound = true;
                end
                temp = temp -1;
            end
            
            %add the least cost node to the path
            [ind,temp] = size(list);
            min = 1000000000000;
            while(temp>0)
                if(list(temp).costh1 < min)
                    min = list(temp).costh1;
                    p = list(temp);
                end
                if(list(temp).costh1 == min)
                    if(p.costh2 > list(temp).costh2)
                        p = list(temp);
                    end
                end
                temp = temp -1;
            end
            S = p;
            
            %If the child node is in history, delete
            [ind,y] = size(path);
            clear ind;
            while y>0
                [ind , ran , v] = find (path(y).node == S.node);
                clear ind;
                clear ran;
                if sum(v)==9
                    fprintf('Solution cannot be found by this heuristic');
                    return;
                end
                y = y-1;
            end
            
            
            pathy = pathy + 1;
            path(pathy) = S;
            dlmwrite('myFile.txt',S.node,'-append',...
'delimiter',' ','roffset',1)
            
            
		
	end
end
