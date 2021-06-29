% LMS weight update.
%inputs:
%1. a: learning rate LMS
%2. m: step parameter
%3. Dv: vertex degree matrix (^ -1/2)
%4. De: hyperedge degree matrix (^ -1)
%5. DV32: vertex degree matrix (^ -3/2)
%6. H: incidence matrix
%7. A: affinity matrix 
%8. fv: ranking vector
%9. wold: old weights
%output:
%1. wnew: updated weights (vector)
function [w]=LMS_W(a,m,Dv,De,Dv32,H,A,fv,wold)
cov = 1e-2;
change = 100000;
flag = false;
counter = 0;
while (change>cov && counter< 1000)
    if flag
        wold = w;
        [Dv,~,Dv32,~] = get_degrees(H,w');
    end
    pi = De * H' * Dv * fv;  

    lambda = size(H,2);

    kappa = H'* Dv32 * H * diag(pi) * wold;

    w = wold - a * ( (eye(lambda) - 2*m * ones(lambda,lambda)) * kappa + 2*m*(wold - ones(lambda,1)) );
    w(w<0)=0;
    change = norm(w-wold);
    flag = true;
    counter = counter + 1;
end
