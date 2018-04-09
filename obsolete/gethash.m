function [l] = gethash(mat)
    j=1;
    k=0;
    for i = 1 : size(mat)
        j=j*mat(i);
        k=k+mat(i);
    end
    l=j+k;
end