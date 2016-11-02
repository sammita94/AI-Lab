function [] = StartGame( )
%STARTGAME Game start
%   Solves the puzzle 8 game using AI techniques : A*
	clear all
    clc
	
    userInput = input('Insert matrix [3x3] to be solved: ');
    tamanho = size(userInput);
    
    
    
    
    if not(all(tamanho == [3 3]))
        msgbox('the matrix should be 3x3 !');

    elseif sum(sum(userInput))~=36
        msgbox('The array must contain values [ 1 2 3; 4 5 6; 7 8 0] !');
    else
        %goalSt = FindGoal(userInput);
        %goalSt;
        goalSt = input('Insert goal matrix [3x3]: ');
		Steepest(userInput, goalSt);
	end
end
