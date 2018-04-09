  testlocalfeat = [];
  testfeat = [];
  bestfeat = [];
  hashSeen = [];
for i = 1 : 4
     disp(['On the ',num2str(i),'th level of the search tree'])
     %add some feature to testFeat[];
     %Best accuracy global here print
       
     for k = 1 : 4 
         bestfeat = testlocalfeat;
         if ~ismember(k,bestfeat)
             testfeat = vertcat(testfeat,k);
             disp(['--Considering adding the ', num2str(k),' feature'])
             %accuracy = KNN(data,current_set_of_features,k+1);
             fprintf(' {%d}  {%d} %%\n',i,k);
          end
      end    
end