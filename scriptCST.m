
%clear;

% --- load data
%load CSTdata.mat;
    % train_vec: (user, item, raring)
    % probe_vec: (user, item, raring)
    % test_vec:  (user, item, raring)
    % U0, V0: the coordinate systems can be estimated using svds or CST   
para.MAX_EPOCH = 100;
para.num_user = 2000;
para.num_item = 2000;

para.num_feat = 5;
para.tradeoff_lambda = 0.1;
para.tradeoff_beta = 0;
para.tradeoff_beta_aux = 0;
para.init_aux = true;
MAX_EPOCH           = para.MAX_EPOCH;
num_user            = para.num_user;
num_item            = para.num_item;
num_feat            = para.num_feat;
tradeoff_lambda     = para.tradeoff_lambda;
tradeoff_beta       = para.tradeoff_beta;
tradeoff_beta_aux   = para.tradeoff_beta_aux;

%%


R = spconvert(aux);
% --- parameters
%RMSE_tr = zeros(MAX_EPOCH, 1);
%RMSE_te = zeros(MAX_EPOCH, 1);
%MAE_tr = zeros(MAX_EPOCH, 1);
%MAE_te = zeros(MAX_EPOCH, 1);

[UMOE B VMOE] = svds(R,num_feat);
%tradeoff_lambda = 1; % tradeoff parameter

% --- training via CST
profile on
[U, B, V, RMSE_tr, RMSE_pr, MAE_tr, MAE_pr, ira] = CST(train, probe, UMOE, VMOE, tradeoff_lambda);
profile off

% --- prediciton on the test data
[rmse, mae, ira] = EvalPred(U,V,B,test,1,0);
