%% HMSO (LMS)
clear

load('data.mat');

n_clusters = 52; %number of clusters
kk=0.001; %learning rate
a = 0.0001;  % learning rate LMS
[fm,pu,wall] = use_LMS_W_update_algorithm(H,W,w,X,n_clusters,kk,a);
w=mean(wall); %representative weight vector
W = spdiags(w(:),0,length(w),length(w));


theta=0.001; %h update step parameter

fm = use_H_update_algorithm(H,W,w,n_clusters,theta);
%or load default
%load('fm.mat')
hold on
[mp_HW_LMS,mr_HW_LMS] = results_thessaloniki_dataset(fm,X);