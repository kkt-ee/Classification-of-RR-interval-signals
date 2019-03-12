%% RUN (RUN 1/4)
% STEP 1 : -R-R INTERVAL EXTRACT-
%
% ----------------------------6 fUNCTIONS-------------------------------------------------------------
%   1. main_rri()      : [rrintervalVector] = rrintV(path,figsavefolpath)                |[main]      
%   2. amptfs()        : [A t Fs]=amptfs(loadfiledata)                                   |[supporting]
%   3. locateR()       : [A_r, t_r,augmentedR] = locateR(A,t,Fs)                         |[filter]
%   4. rri()           : [RRinterval] = rr(t_r)                                          |[core]
%   5. vizresults()    : vizresults(t,A,augmentedR, A_r, t_r, data_vname,figsavefolpath) |[optional]  
%   6. figsave()       : figsave(f,data_vname,figsavefolpath)                            |[optional]  
% ====================================================================================================
% RUN (GUIDE)
%  A. USER INPUT >> :
%       path             = "_________";    % Enter path of lvm files (i.e. signal files)
%       figsavefolpath   = "_________";    % Enter path to save the generated figures
%       threshold        = "_________";    % Enter threshold value for min height of R-Peak
%
%  B. call main fUNCTION: main_rri() >>
%       [RRIvector] = main_rri(path,figsavefolpath,threshold);

%% USER INPUT >>
%[ENTER PATH OF LVM FILES]
path = '/mnt/pd/alGO/_SHELVE/RQA_uC-rri/step1_RRI/ECGsmokers5min/testsig/';
%[ENTER PATH TO SAVE COMPUTED FIGURES]
figsavefolpath = '/mnt/pd/alGO/_SHELVE/RQA_uC-rri/step1_RRI/ECGsmokers5min/testsig/Res/';

%[ENTER MINIMUM THRESHOLD VALUE FOR R-PEAK]
threshold = .8;


%% << calling main() >> 
RRIvector = main_rri(path,figsavefolpath,threshold);

%% RESULT:
% RRIvector is a cell array {#lvmfiles x 2 }; sid in col2 of
% RRIvector{'signame', sig[N x 1]}

%% -------------------Optional todo-----------------------------------
%function data_=createTable(Name,RRinterval)



