% Updates hypergraph topology
%inputs:
%1. H: Incidence matrix
%2&3. W, w: Weight diagonal matrix & vector
%4. n_clusters: number of clusters
%5. theta: step parameter 
%output:
%1. fm: ranking vectors
function [fm] = use_H_update_algorithm (H,W,w,n_clusters,theta)

%Degree Matrices-------------------------------------------------
[Dv,De,Dv32,De2] = get_degrees(H,w);

%Affinity matrix
A = getA(Dv,H,W,De);
disp('A Calculated')
%% f optimization step
disp('f optim step')
[fm,~] = f_optim(H,Dv,De,W,n_clusters,1,0,A);
%% optimization steps for h and f, iteratevly
counter=1;
norma(counter)=10000;
while norma(counter)>1e-02
    %h update step
    disp('H optim step')
    [Hnew]=h_update(theta,H,Dv,De,Dv32,De2,W,fm);
    %Norm between H and updated H
    norma(counter)=norm(H-Hnew,'fro')/norm(H,'fro');
    fprintf('change: %f\n',norma(counter));

    H=Hnew;
    clear Hnew
    %f optimization step
    disp('f optim step')
    [fm,A] = f_optim(H,Dv,De,W,n_clusters,1,0);
end




end