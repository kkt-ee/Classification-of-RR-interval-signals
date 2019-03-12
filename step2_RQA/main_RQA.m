%% [MAIN] fn
% STEP 2 : -RQA-
%
% RQAstatistics: R-R Intervals on Smokers data (Before and after smoking)
%                                    ---(computes for entire signal data)
%
%       RRIvector : Output from STEP 1 (file: main_rri.m)
%
% !!! User INput: folder name for saving plots
% (move to run)

%% main fUNCTION : main_RQA()
function RQAstatistics = main_RQA(RRIvector)%,resultdir)
global resultdir
clc
errors = 'errors:\n';                                                        % To log for data that cannot be precessed from RR data

% Path for saving plots in jpg format
%resultdir='_______________________'; 

%% THE BIG FOR LOOP (FOR ENTIRE DATA SET)
for i = 1:length(RRIvector(:,1))
%length(RRIvector)    
close all

filename=RRIvector{i,1};
RQAstatistics{i,1} = filename;                                              % RQAstatistics column 1 will store filenames
%
%try
   ecg = RRIvector{i,2}{1,1};                                               % Loading RR data frrom cells one by one from RRI data
   RQAstatistics{i,2} = RQA(ecg,filename)%,resultdir)                    % RQA(): fUNCTION call,
                                                                            % THE CALCULATED STATISTICSAL DATAs : % RQAstatistics column 2
   
%catch
 %  errors=strcat(errors,' ',filename);                                      % In error cases "errors" string UPDATES
%end

%pause              % comment out for pausing after each execution
end
%%
fprintf(errors)
end