% calculates ranking vectors f.
%inputs:
%1. H: incidence matrix
%2. Dv: vertex degree matrix (^ -1/2)
%3. De: hyperedge degree matrix (^ -1)
%4. W: weight matrix
%5. testsize: number of clusters
%6. isMatr: boolean. O if you want to compute a spesific ranking vector. 1
%if you want to compute all ranking vectors.
%7. doc: only with isMatr=1. set the document (cluster) for which computes 
%the ranking vector.
%8. A: the affinity matrix (not necessery)
%outputs:
%1. f1: ranking vector or matrix tha contains all ranking vectors
%2. A: the affinity matrix
function [f1,A] = f_optim(H,Dv,De,W,testsize,isMatr,doc,A)
% set matrices form (sparse or full) to reduce computational complexity
H=full(H);
Dv=sparse(Dv);
De=sparse(De);
W=sparse(W);
%identity matrix
I = eye(size(H,1),size(H,1));
    if nargin<8
        %reduce computational complexity
        partA=full(Dv*H*W*De);
        partB=full(H'*Dv);
        A=partA*partB;
        A=(A+A')/2;
    end
    temp=I-0.9*A;
    if isMatr==1
        %compute all ranking vectors
        y=zeros(size(A));
        for i=1:testsize
            y(:,i) = A(i,:)';
            y(i,i)=1; 
        end
        t=inv(temp);
        f1=t*y;
    else
        %compute 1 specific ranking vector
        y(:,1) = A(doc,:)';
        y(doc,1)=1; 
        t=inv(temp);
        f1=t*y;
    end
end