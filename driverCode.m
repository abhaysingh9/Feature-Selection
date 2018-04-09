function driverCode()
    clc;
    fprintf('Feature Selection Program\n');
    filename = input('Type the name of the file to test: ','s');
    Data = load (filename);
    %Data = load ('smalldata.txt');
    idx = randperm(size(Data,1));
    DataTrain = Data(idx(1:end),:);
    DataTest = Data(idx(100:end),:);
    Y = DataTrain(:,1);
    X = DataTrain(:,2:end);
    y = DataTest(:,1);
    x = DataTest(:,2:end);
    fprintf('\n Select the algorithm to test: \n');
    fprintf('1. Brute-Force Forward Selection \n');
    fprintf('2. Brute-Force Backwards Ellimination \n');
    fprintf('3. Sequential Greedy Forward Selection \n');
    fprintf('4. Sequential Greedy Backward Elimination \n');
    fprintf('5. Hill Climbing Forward Selection algorithm\n');
    ip = input('Input: ');
    
    fprintf('Normalizing w.r.t. columns(features)....');
    
    %normalize by column
    X_n = normc(X);
    x_n = normc(x);
    fprintf('Done!\n\n');
    fprintf('Beginning Search\n\n');
    if ip == 1
        tic
        forwardbrute(Data,X_n,Y,x_n,y);
        toc
    elseif ip == 2
        tic
        backbrute(Data,X_n,Y,x_n,y);
        toc
    elseif ip == 3
        tic
        minsfs(Data,X_n,Y,x_n,y); 
        toc
    elseif ip == 4
        tic
        backgreedy(Data,X_n,Y,x_n,y);
        toc
    elseif ip == 5
        tic
        sfs(Data,X_n,Y,x_n,y); 
        toc
    end
end