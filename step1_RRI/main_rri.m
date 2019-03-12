%% [MAIN] fn
% STEP 1: -R-R Interval extract- 

% 1. function (main): returns 'data_' after processing all files in directory='path'
%     ...saves the figures in directory 'figsavefolpath'(optional)

function [rrintervalVector] = main_rri(path,figsavefolpath,threshold)
%path= '_______________________';  % Your folder (for troubleshooting)

files = fullfile(path,'*.lvm');                                             % only .lvm files
d=dir(files);                                                               % walking directory for files
%% Processing data one by one

for k=1:numel(d)                                                            % LOOPING through each filenames
   filename=fullfile(path,d(k).name);
   varname=strtok(d(k).name,'.');                                            % 'strtok'- selects parts of the string(string token); here it creates the 'variable name'                                                         
   %% REMOVE
   %l={'P1AS10', 'P1AS12', 'P2BS12', 'P3AS12', 'P3BS12'}; %remove
   %l={'P1AS1'};%remove
   %if ismember(varname,l) %remove
   %% 
   rrintervalVector{k,1}=varname; 
   %try
      loadfiledata=load(filename);
      
      [A t Fs]=amptfs(loadfiledata);                                        % fUNCTION CALL amptfs() 
      [A_r, t_r,augmentedR] = locateR(A,t,Fs,threshold);                    % fUNCTION CALL locateR()
      
      [RRinterval] = rri(t_r);                                              % fUNCTION CALL rri()
      
      %rrintervalVector{k,1}=varname;                                       % for "variable names"
  
      vizresults(t,A,augmentedR,A_r,t_r,varname,figsavefolpath);            % (Optional)
      %pause   % comment out to increase execution speed
      close all
      
      eval([varname '={RRinterval};']);
      fprintf('%10s done\n',varname)
   %catch
     % fprintf("%10s error!!!\n",varname)
   %end
end
%pause
%close all
%end

for i=1:length(rrintervalVector)
    try
        rrintervalVector{i,2}=eval(rrintervalVector{i,1});
    end
end

end
