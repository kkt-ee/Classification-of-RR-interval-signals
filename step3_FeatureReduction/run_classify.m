%% RUN (Run 3/4)    
% STEP 3 : CLASSIFICATION
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% RUN (GUIDE):
%       A. USER INPUTS >>
%          a. [Code gap] [MANUALLY EDIT] the xlsx file obtained from step2 for P1 P2 and P3 
%                      ....SET the data to two classes (eg. before and after stimulus)
%                      ....SAVE as a < new xlsx file >
%          b. [Preq] Manually load the < new xlsx file > to workspace using GUI techniques
%          c. workspaceTableVariable = _____________;   % 
%             classVariableInTable   = '_____';         % Specify the name of the category/class variable in loaded table
%
%       B. Calling main fUNCTION : main_classify >>
%              impPredictors = main_classify(workspaceTableVariable, classVariableInTable)   % Loaded table <subject to change>
%`~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

close all
%% USER INPUTS 

%oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
%[ENTER VALUE] >>>
workspaceTableVariable = RQAstep2resultsS5Copy;    % < rrisamsampletableS3 > Subject to change [Enter xlsxfile name]

%[ENTER VALUE] >>>
classVariableInTable = 'LABELS';       % Enter category/class variable name
%oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo


%runrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrun
% << calling main() >> 
impPredictors = main_classify(workspaceTableVariable, classVariableInTable);   % Loaded table <subject to change>

%runrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrun







% DATE: 10 JUL 18
% Avg_NEIGH          : P1
% DET LAM DIV        : P2
% ENT RATIO          : P3
% ENT LAM LMAX VMAX  : P1P2P3
% RATIO AVG_NEIGH    : ASBS



%% OUTPUT : We get Important Predictors from the loaded RQA features' table 
%           ------>>> To plug in this Important Predictors to Neural Nerwork in Step 4 

% OBSERVATIONS (Important Predictors):
%       ---(Pre and Post smoking Data)
%   P1 :
%   P2 :     'DET' 'LAM'
%   P3 :     'ENT' 'RATIO'