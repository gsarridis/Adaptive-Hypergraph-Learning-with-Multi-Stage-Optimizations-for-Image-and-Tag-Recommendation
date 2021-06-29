% LMS weight update
%inputs:
%1. H: Incidence matrix
%2&3. W, w: Weight diagonal matrix & vector
%4. n_clusters: number of clusters
%5. kk: step parameter 
%6. X: groundtruth
%7. a: learning rate LMS
%outputs:
%1. fm: ranking vectors
%2. pu: matrix. Rows test clusters. Columns recommended clusters. 1 if it is
%relevant, else 0.
%3. wall: matrix with weight vectors (one per cluster)
function [fm,pu,wall] = use_LMS_W_update_algorithm (H,W,w,X,n_clusters,kk,a)

%Degree Matrices-------------------------------------------------
[Dv,De,Dv32,~] = get_degrees(H,w);

%Affinity matrix
A = getA(Dv,H,W,De);
disp('A Calculated')
%% f optimization step
disp('f optim step')
[fm,~] = f_optim(H,Dv,De,W,n_clusters,1,0,A);
%% W update for each cluster

%keep initial matrices
Ainit = A;
Dvinit = Dv;

for i=1:n_clusters
    fprintf('\ncluster: %d\n',i)
    A=Ainit;
    Dv=Dvinit;
    disp('W update')
    wnew  = LMS_W(a,kk,Dv,De,Dv32,H,A,fm(:,i),w');

    wnew = wnew';
    wnew(wnew<0)=0;
    %create diagonal matrix W
    n = length(wnew);
    Wnew = spdiags(wnew(:),0,n,n); 
    
    disp('compute A H W DV DE')
    [Dv,De,~,~] = get_degrees(H,wnew);
    A = getA(Dv,H,Wnew,De);
    disp('f optim step')
    [f1,~] = f_optim(H,Dv,De,Wnew,n_clusters,0,i,A);
    ff = f1(1:n_clusters);
    [~,findex] = sort(ff,'descend');
    pu(:,i) = X(i,findex(2:n_clusters));
    %store weights for all iterations
    wall(i,:)=wnew;
end 




end