%computes affinity matrix
%inputs:
%1. H: incidence matrix
%2. Dv: vertex degree matrix (^ -1/2)
%3. De: hyperedge degree matrix (^ -1)
%4. W: weight matrix
%output:
%1. A: affinity matrix
function A = getA(Dv,H,W,De)

%select sparse or full to reduce computational complexity
H=full(H);
Dv=sparse(Dv);
De=sparse(De);
W=sparse(W);

%split to reduce computational complexity
partA=full(Dv*H*W*De);
partB=full(H'*Dv);
%affinity matrix
A=partA*partB;
A=(A+A')/2;
end