%% Greedy Forward selection
function minsfs(data,X,Y,x,y)
    [m n] = size(X);
    test = 0;
    temp = 0;
    bestf = 0;
    bestacc = 0;
    tempacc = 0;
    %selecting first row
    for i = 1:n
        cols = i+1;
        acc = KNN(data(:,[1 cols]));
        fprintf('Using feature(s) {%d} accuracy is %.1f %%\n',i,acc*100);
        if tempacc <= acc
            bestf = i;
            bestacc = acc;
            tempacc = acc;
        end
    end
    fprintf('Feature set {%d} was best accuracy is %.1f %%\n',bestf,bestacc*100);
    feature = 0;
    temp = bestf;
    while size(temp) < n-1
        tempacc = 0;
        if size(temp)==1
            test = X(:,temp(1));
            testx = x(:,temp(1));
        else
            test = [test X(:,temp(size(temp)))];
            testx = [testx x(:,temp(size(temp)))];
        end
        for i = 1:n
            if ~ismember(i, temp(:))
                datatotrain =data(:,[1 temp+1 i+1]);
                acc = KNN(datatotrain);
                g = sprintf('%d ', [temp i]);
                fprintf('Using feature(s) {%s} accuracy is %.1f %%\n',g,acc*100);
                if tempacc < acc
                    feature = i;
                    pg = g;
                    tempacc = acc;
                end
            end
        end
        
        temp = [temp feature];
        if bestacc <= tempacc
            bestf = [bestf feature];
            bestacc = tempacc;
        else
            fprintf('Accuracy decreased!!!!! going deeper looking for local max\n');
            bg = sprintf('%d ', bestf);
        end
        fprintf('Feature set {%s} had the best accuracy at %.1f %%\n',pg,tempacc*100);
    end
    bg = sprintf('%d ', bestf);
    fprintf('Search has been finished!! The best feature subset {%s} has accuracy: %.1f %%\n',bg,bestacc*100);
end
