%{function  gforwards(X,Y,x,y)
%{
  testFeat = [];
  bestFeat = [];
  hashSeen = [];
  
    for i = 1 : size(X,2)
        disp(['On the ',num2str(i),'th level of the search tree'])
        %add some feature to testFeat[];
        %Best accuracy global here print
        
        for k = 1 : size(X,2) 
            if ~member(gethash(testFeat),hashseen)
            disp(['--Considering adding the ', num2str(k),' feature'])
            accuracy = KNN(data,current_set_of_features,k+1);
        
                if accuracy > best_so_far_accuracy 
                    best_so_far_accuracy = accuracy;
                    bestFeat = testFeat
                end        
            end
        end    
    
    end

  
  %}
examiningFeat = []; % Initialize 
  testlocalfeat = [];
  testfeat = [];
  bestfeat = [];
  hashSeen = [];
for i = 1 : 4 
    disp(['On the ',num2str(i),'th level of the search tree'])
    feature_to_add_at_this_level = [];
    
    best_so_far_accuracy    = 0;    
    
     for k = 1 : 4 
       if isempty(intersect(current_set_of_features,k)) % Only consider adding, if not already added.
        disp(['--Considering adding the ', num2str(k),' feature'])
        accuracy = leave_one_out_cross_validation(data,current_set_of_features,k+1);
        
        if accuracy > best_so_far_accuracy 
            best_so_far_accuracy = accuracy;
            feature_to_add_at_this_level = k;            
        end        
      end
     end
    
    current_set_of_features(i) =  feature_to_add_at_this_level;
    disp(['On level ', num2str(i),' i added feature ', num2str(feature_to_add_at_this_level), ' to current set'])
        
 end 
