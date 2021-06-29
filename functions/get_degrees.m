%computes the degrees of incidence matrix
%inputs:
%1. H: incidence matrix
%2. w: weights (vector)
%outputs:
%1. Dv: vertex degree matrix (^ -1/2)
%2. De: hyperedge degree matrix (^ -1)
%3. Dv32: vertex degree matrix (^ -3/2)
%4. De2: hyperedge degree matrix (^ -2)
function [Dv,De,Dv32,De2] = get_degrees(H,w)
%vertices degrees
Vdegrees = H*w';
%hyperedge degrees
Hdegrees = sum(H,1);

Dv=diag(bsxfun(@power, Vdegrees, -1/2));
infindex = isinf(Dv);
Dv(infindex) = 0;
Dv=sparse(Dv);

De=diag(bsxfun(@power, Hdegrees, -1));
infindex = isinf(De);
De(infindex) = 0;
De=sparse(De);


De2=diag(bsxfun(@power, Hdegrees, -2));
infindex = isinf(De2);
De2(infindex) = 0;
De2=sparse(De2);

Dv32=diag(bsxfun(@power, Vdegrees, -3/2));
infindex = isinf(Dv32);
Dv32(infindex) = 0;
Dv32=sparse(Dv32);
end