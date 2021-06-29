%calculates precision - recall and plots the results
%inputs:
%1. fm: matrix which contains all ranking vectors
%2. X: groundtruth
%outputs:
%1. mp: mean precision
%2. mr: mean recall
function [mp,mr] = calc_and_plot_results(fm,X)

%initialize
testsize = size(X,1);
res=testsize-1;
p=zeros(res,testsize);

% calculate results
for i=1:testsize
        ff = fm(1:testsize,i);
        [~,findex] = sort(ff,'descend');
        p(:,i) = (X(findex(2:(res+1)),3)==X(findex(1),3));
end 

%calculate precision - recall
step =1;maxsample=res;
recall = zeros(maxsample,testsize);
precision = zeros(maxsample,testsize);

for j=1:testsize
    for test_set_size=1:step:maxsample
        test_set=p(1:test_set_size,j);
        result_tags=nnz(test_set);
        %recall rate
        recall(test_set_size,j)=(result_tags)/X(j,4);
        %precision rate
        precision(test_set_size,j)=(result_tags)/test_set_size;
    end
end

% set the NaN values to 0
for i =1:testsize;recall(isnan(recall(:,i)),i)=0;end
for i =1:testsize;recall(isinf(recall(:,i)),i)=0;end
% average 
mp = mean(precision,2);
mr = mean(recall,2);
%plot results
hold on
plot(mr,mp)
xlabel('Recall')
ylabel('Precision')
title('Precision-Recall curve')
end

