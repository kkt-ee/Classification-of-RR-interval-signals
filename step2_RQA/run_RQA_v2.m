%% RUN (RUN 2/4)
% STEP 2 : [RQA] R-R Intervals on Smokers data (Before and after smoking)
% RQA_v2 : v2 [computes for all signal files]
%        .......(computes for entire dataset)
% 
% RUN (GUIDE)
%     A. USER Input >> 
%            [PREREQUISITE]- lOAD WORKSPACE WITH THE 'RRI DATASET'(.mat file if saved) (calculated from --main_rri.m) 
%            Tablefilename  = '_____________'; % Enter 'RQA statistics' filename for the file to be created
%            figsavefolname = '_____________'; % Enter the folder path for saving plot figures
%
%     B. calling main fUNCTION >> 
%            RQAstatistics = main_RQA(RRIvector,figsavefolname)
%      
%     C. OTHER COMMANDS >>
%            Tnew = CreateTable(RQAstatistics); % call CreateTable() to create a RQAstatistics Table
%            writetable(Tnew,Tablefilename);    % Write the table to file Tablefilename
%
%     NOTE: To pause after each execution: comment out line 35 of main_RQA.m  

%% USER Input >>


%oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
% [PREREQUISITE] lOAD WORKSPACE WITH THE 'RRI DATASET'(.mat file if saved) (calculated from --main_rri.m) 

global resultdir
% [ENTER VALUE]
Tablefilename = 'C:\Users\kishore\Desktop\RQA-example\v2d1A_1Hz_RQA.csv'; 
resultdir = 'C:\Users\kishore\Desktop\RQA-example\Results';


%oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
% << calling main() >> 
%RQAstatistics = main_RQA(RRIvector,figsavefolname)
RQAstatistics = main_RQA(x)%,figsavefolname)

%%
% << Creating Table >>
Tnew=CreateTable(RQAstatistics);                   % fUNCTION CALL : CreateTable()
writetable(Tnew,Tablefilename);                    % Writing table to file 'Tablefilename'

%runrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrunrun
% ...
% ...
% make README file ...

% !!!
% Errors Last run 28-May-18:
% P1AS11 P1BS10 P1BS7 P1BS8 P2BS12 P3AS12




%% OUTPUT: Table if RQA features ------->>> (Code gap) Manual Process the table (README STEP 3) 
%  Processed table ---->>> Next: 
%           STEP 3: (a) t-test, 
%                   (b) feature reduction (classification)   