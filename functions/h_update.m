% update H as HMSO proposes.
%inputs:
%1. theta: learning rate parameter
%2. Dv: vertex degree matrix (^ -1/2)
%3. De: hyperedge degree matrix (^ -1)
%4. H: incidence matrix
%5. Dv32: vertex degree matrix (^ -3/2)
%6. De2: hyperedge degree matrix (^ -2)
%7. fm: ranking vectors
%8. W: weight matrix
%output:
%1. Hnew: updated incidence matrix
function [Hnew]=h_update(theta,H,Dv,De,Dv32,De2,W,fm)
    J= ones(size(H));
    H=full(H);
    %H update
    PGD=J*diag(diag(((H'*Dv)*fm)*(fm'*(Dv*H))))*((W*De2))+(Dv32.*(H*W*De*H'*Dv)*fm*fm')*(J*W)-(2*(Dv)*fm)*(fm'*(Dv*H*W*De)); 
    Hnew =  H - theta*PGD;
    clear PGD
    %projection
    Hnew(Hnew<0)=0;
    Hnew(Hnew>1)=1;
end