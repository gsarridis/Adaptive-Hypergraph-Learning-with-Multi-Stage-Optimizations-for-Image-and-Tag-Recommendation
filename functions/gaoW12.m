% Update weigths as Gao proposed at 2013.
%inputs:
%1. m: learning rate parameter
%2. Dv: vertex degree matrix (^ -1/2)
%3. De: hyperedge degree matrix (^ -1)
%4. H: incidence matrix
%5. A: affinity matrix 
%6. fv: ranking vector
%output:
%1. wnew: updated weights (vector)
function [wnew]=gaoW12(m,Dv,De,H,A,fv)

ne = size(H,2);

gamma = Dv * sparse(H);
gamma=sparse(gamma);

fgDegf_2nem = ((((fv' * gamma) * De) * (gamma' * fv))/(2*ne*m));
for i=1:ne
    
    wnew(i) = 1/ne - fgDegf_2nem + ((((fv' * gamma(:,i)) * De(i,i)) * (gamma(:,i)' * fv))/(2*m));   
    
end

%toc