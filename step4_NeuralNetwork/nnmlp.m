%% [CORE] fn
% STEP 4 : -NEURAL NETWORK-
%                   ...MLP
%
%       ---(Test 1 MLP NN)

%% core fUNCTION : nnmlp() 
%
% Passing one row of parameters from table training and testing 1 NN
%   xlsfile       : It is the Features file
%   sheetname     : Sheet name of xlsfile
%   impPredictors : Obtained from STEP 3 (classification)
%   a,b           : Two classes (Pre stimulus & Post stimulus)
%   NNparam       : Input parameters for Neural Network
%   Neurons       : No of neurons in hidden layer


function [PerfTrain, PerfTest, PerfValidate PerfTotal] = nnmlp(xlsxfile,sheetname,impPredictors,a,b,NNparam,Neurons)
%% testing
%{
xlsxfile
sheetname
impPredictors
a
b
NNparam
Neurons
%}
close all;
nntraintool('close')
%% creating Input and Target
[num,txt,~] = xlsread(xlsxfile,sheetname);              % read excel data file
specified_class=txt(2:end,1); %read class column(1st)
Index_classA = find(contains(specified_class,a)); %(find index of class A)
Index_classB = find(contains(specified_class,b)); %(find index of class B)

nn_Target=zeros(2,size(specified_class,1));% SPecify class in binary (1,0) form for NN tool box
nn_Target(1,Index_classA)=1;
nn_Target(2,Index_classB)=1;
%%
features = {'recrate', 'DET', 'LMAX', 'ENT', 'LAM', 'TT', 'VMAX', 'RATIO', 'avg_neighbours', 'DIV', 'Avg_diag'};  %all features
%features = {'A1','A2','A3','A4','A5','A6','A7','A8','A9','A10','C1','C2','C3','C4','C5','C6','C7','C8','C9','C10'};  %all features

for i=1:length(impPredictors)
    idx(i) = find(contains(features,impPredictors{i}));                     % idx will store the index of impPredictors
    nn_input(:,i)=num(:,idx(i));
end

nn_input=nn_input';
%% Creating NEURAL NET
%nn_input=[num(:,1) num(:,2) num(:,3) num(:,4)]'; % select feature in column 1,2,3,4

setdemorandstream(491218382)                 % Random seed

%trainfn=NNparam.trainfn{1,1} %remove
%errfn=NNparam.errfn{1,1};    %remove
net = patternnet(Neurons,NNparam.trainfn{1,1},NNparam.errfn{1,1});      % 'Neuron' hiden layers

net.layers{1}.transferFcn=NNparam.actfn1{1,1};
net.layers{2}.transferFcn=NNparam.actfn2{1,1};

%net.divideParam.trainRatio = 70/100;
%net.divideParam.valRatio = 15/100;
%net.divideParam.testRatio = 15/100;

%view(net)                                   % View the NN structure
[net,tr] = train(net,nn_input,nn_Target);   % NN start training by randomly dividing data into training and test
nntraintool                                 % open NN GUI
plotperform(tr)                             % performance graph

%% Test classifier with test data && Plotting and printing
testX = nn_input(:,tr.testInd);
testT = nn_Target(:,tr.testInd);
testY = net(testX);

testIndices = vec2ind(testY);

vX = nn_input(:,tr.valInd);
vT = nn_Target(:,tr.valInd);
vY = net(vX);

trainX = nn_input(:,tr.trainInd);
trainT = nn_Target(:,tr.trainInd);
trainY = net(trainX);

%plotconfusion(testT,testY)  %Plot confusion matrix 

[cT,cmT] = confusion(trainT,trainY);   % TRAIN 
PerfTrain=100*(1-cT);

%plotconfusion(testT,testY)%Plot confusion matrix
[cV,cmV] = confusion(vT,vY); % VALIDATE
PerfValidate=100*(1-cV);

%plotconfusion(testT,testY)%Plot confusion matrix
[cTst,cmTst] = confusion(testT,testY); % TEST
PerfTest=100*(1-cTst);

plotroc(testT,testY)

allX = nn_input;
allT = nn_Target;
allY = net(allX);
[c,cm] = confusion(allT,allY); % TEST
PerfTotal=100*(1-c);
%plotconfusion(allT,allY)
%% Print

fprintf('[TRAIN]    Percentage Correct Classification   : %f%%\n', 100*(1-cT));
fprintf('[TRAIN]    Percentage Incorrect Classification : %f%%\n', 100*cT);
fprintf('[VALIDATE] Percentage Correct Classification   : %f%%\n', 100*(1-cV));
fprintf('[VALIDATE] Percentage Incorrect Classification : %f%%\n', 100*cV);
fprintf('[TEST]     Percentage Correct Classification   : %f%%\n', 100*(1-cTst));
fprintf('[TEST]     Percentage Incorrect Classification : %f%%\n', 100*cTst);
fprintf('[ALL]      Percentage Correct Classification   : %f%%\n', 100*(1-c));
fprintf('[ALL]      Percentage Incorrect Classification : %f%%\n', 100*c);


end
