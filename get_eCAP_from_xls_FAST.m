function [options, peaks] = get_eCAP_from_xls_FAST(filename)

% [eCAPs, options, raw_sweeps, peaks] = get_eCAP_from_xls(filename)
%   Takes an Excel filename (produced by Custom Sound EP) as input.
%   Output is:
%       - eCAPs: a cell array containing each averaged eCAP, artifact
%         cancelled.
%       - options: a struct array containing the details of each condition.
%         Same length as eCAPs.
%       - raw_sweeps: a struct array with the averaged waveforms of each
%         frame used for artifact cancellation.
%       - peaks: the peaks as found by Custom Sound EP.

%   CG updates in 11-2018:
%       - remove first two unused output arguments from xlsread() functions
%       - separate make_valid_fieldname() j loops from repeated j loop for
%       efficiency so it only has to be called once for the number of
%       columns in the xls spreadsheet tab instead of every time a row is
%       written. Decreases processing speed to ~3/10 of previous version.

%----------------------------------------
% Etienne Gaudrain, 06-2012 | Charlotte Garcia, 11-2018
% MRC Cognition and Brain Sciences Unit, Cambridge, UK
%----------------------------------------

nDots = 50;

% Options [NRT Series]
fprintf('Reading [NRT series] from ''%s''\n', filename);
[~, ~, raw] = xlsread(filename, 'NRT Series');
options = struct(); 
for j = 1:size(raw,2)
    raw{2,j} = make_valid_fieldname(raw{2,j});
end
for i=3:size(raw,1) 
    if floor(i/size(raw,1)*nDots)-floor((i-1)/size(raw,1)*nDots)>=1 
        fprintf('.'); 
        drawnow();
    end
    for j=1:size(raw,2)
        options(i-2).(raw{2,j}) = raw{i,j}; 
    end
end
fprintf('\n');



% peaks [NRT Peaks]
fprintf('Reading [NRT Peaks] from ''%s''\n', filename)
[~, ~, raw] = xlsread(filename, 'NRT Peaks'); 
peaks = struct(); 
for j = 1:size(raw,2)
    raw{1,j} = make_valid_fieldname(raw{1,j});
end
for i=2:size(raw,1)
    if floor(i/size(raw,1)*nDots)-floor((i-1)/size(raw,1)*nDots)>=1
        fprintf('.');
        drawnow();
    end
    for j=1:size(raw,2)
        peaks(i-1).(raw{1,j}) = raw{i,j};
    end
end
fprintf('\n');

%============================================================
function f = make_valid_fieldname(s)

f = strrep(s, ' ', '_');
f = strrep(f, '(', '');
f = strrep(f, '-', '');
f = strrep(f, ')', '');
f = strrep(f, '/', '_');
f = strrep(f, 'µ', 'u');
f = strrep(f, '.', '');
f = genvarname(f);

