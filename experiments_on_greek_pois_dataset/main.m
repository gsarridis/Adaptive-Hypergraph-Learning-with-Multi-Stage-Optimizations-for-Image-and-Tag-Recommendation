%% optional clear
clear
clc
close all

%% load the hypergraph
disp("Loading mat files...")
load('data.mat')
n_clusters = 5000; %number of clusters

%% load updated weight matrix (W update algorithm, Gao)
% load weights to avoid the time consuming procedure of w update
load('w_updated.mat')

% or uncomment the following lines to compute weights
% [fm,pu,wall] = use_W_update_algorithm (H,W,w,X,n_clusters,0.1);
% w=mean(wall); %representative weight vector
% W = spdiags(w(:),0,length(w),length(w));

%% H update algorithm
theta=100; %h update step parameter
disp("Start training...")
fm = use_H_update_algorithm(H,W,w,n_clusters,theta); %perform H update

%% Plot Results
[mp,mr] = calc_and_plot_results(fm,X); % plot results
