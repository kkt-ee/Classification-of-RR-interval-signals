%% RUN (RUN 4/4)
% STEP 4 : NEURAL NETWORK
%   a) MLP (Multilayer Perceptron)
%
%   A. USER INPUTS >>
%         xlsxfile        = "________"                % ENTER xlsx filename with "RQA features" (From STEP 2)
%         sheetname       = "________"                % ENTER sheetname of the xlsxfile
%         hiddenNeurons   = [__:__]                   % Set RANGE for number of neurons in hidden layer 
%       
%         CLASS NAMES/  a = "____"                    % ASSUMPTION: Data contains only two classes 
%         CATEGORIES    b = "____"                        ...eg. (Pre-stimulus & Post-stimulus) 
%           
%         impPredictors   = {"___","___",...,"___"}   % ENTER impPredictors obtained from STEP 3: "CLASSIFICATION"
%    
%    B. Calling main fUNCTION call: main_nnmlp() >>
%         Tnnresults= main_nnmlp(xlsxfile,sheetname,hiddenNeurons,a,b,impPredictors)
%       

clc
clear all
%% User Inputs >>
% NOTE: Edit CONSTANTS in main_nnmlp.m if needed (eg.to change training algorithm)

% ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
%[ENTER VALUE] 
%xlsxfile="/home/k/Documents/Prj1_paper1/Prj1_paper1/RESULTS/RQAstep2results.xls";                                
xlsxfile="/home/k/Desktop/order_10_p1s_ns.xls"

%[ENTER VALUE] 
sheetname='Sheet1';                                             

%[ENTER VALUE] 
hiddenNeurons = [3:4];                                     

%[ENTER VALUE] 
a = 'P1NS';                                                 
b = 'P1S';                                                 

%[ENTER VALUE] 
impPredictors = {'C1','C6','C10'};                               
% ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo



% << calling main() >> 
Tnnresults= main_nnmlp(xlsxfile,sheetname,hiddenNeurons,a,b,impPredictors)

%runrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrun




%% OBSERVATIONS: RQA ANN-MLP R-R INTERVAL DATA 
% P1 : MAX CLASSIFICATION ACCURACY 81 % -- P1 DAY 1
% P2 : MAX CLASSIFICATION ACCURACY 86 % -- P2 DAY 12
% P3 : MAX CLASSIFICATION ACCURACY 90 % -- P3 DAY 21
