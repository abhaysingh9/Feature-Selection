function  backbrute(data,X,Y,x,y)
  feats = (1:1:size(X,2));
  acc = 0;
  bestaccuracy=0;
  fprintf('Considering feature(s) {%s} %.1f %%\n',sprintf('%d ',feats));
  acc = KNN(data);
  fprintf('accuracy obtained: %.1f %%\n',acc*100);
  bestaccuracy = acc;
    for i = 1 : size(feats,2) -1 
        featcom = combnk(feats,i);
        for j = 1 : size(featcom,1)
            a =setdiff(feats,featcom(j,:));
            fprintf('Considering feature(s) {%s} %.1f %%\n',sprintf('%d ',a));
            b = a + 1;
            teainon = data(:,[1 b]);
            [acc] = KNN(teainon);
            fprintf('accuracy obtained: %.1f %%\n',acc*100);
            if acc >= bestaccuracy
                bestaccuracy = acc;
                bestFeat = a;
            end
        end
        fprintf('Best feature(s) so far are {%s} with accuracy: %.1f %%\n'...
            ,sprintf('%d ',bestFeat),bestaccuracy*100);
    end
    fprintf('Search Completed!!! Best Features: {%s} accuracy: %.1f %%\n'...
            ,sprintf('%d ',bestFeat),bestaccuracy*100);
end