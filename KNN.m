%% KNN subroutine
function [accuracy] = KNN(data)
    accuracy = 0;
    for i = 1:size(data,1);
        DataTest = data(i,:);
        DataTrain = setdiff(data,DataTest,'rows');
        Y = DataTrain(:,1);
        X = DataTrain(:,2:end);
        y = DataTest(:,1);
        x = DataTest(:,2:end);
        accuracy = accuracy + KNNcompute(1,X,Y,x,y,data);
    end
    accuracy = accuracy / size(data,1);
end


function [acc] = KNNcompute(k,data,labels,t_data,t_labels,dataraw)

label=zeros(size(t_data,1),1);
ed=zeros(size(t_data,1),size(data,1)); %ed: (MxN) euclidean distances
ind=zeros(size(t_data,1),size(data,1)); %corresponding indices (MxN)

%calc euclidean distances
for test_point=1:size(t_data,1)
    for train_point=1:size(data,1)
        %calc and store sorted euclidean distances with corresponding indices
        ed(test_point,train_point)=sqrt(...
            sum((t_data(test_point,:)-data(train_point,:)).^2));
    end
    [ed(test_point,:),ind(test_point,:)]=sort(ed(test_point,:));
end

%find the nearest k for each data point
knn = ind(:,1:k);
index = knn(:,1);
%get  vote
for i=1:size(knn,1)
    options=unique(labels(knn(i,:)'));
    max_count=0;
    max_label=0;
    for j=1:length(options)
        L=length(find(labels(knn(i,:)')==options(j)));
        if L>max_count
            max_label=options(j);
            max_count=L;
        end
    end
    label(i)=max_label;
end

    %calculate the classification accuracy
    if isempty(t_labels)==0
        acc=length(find(label==t_labels))/size(t_data,1);
    end
end