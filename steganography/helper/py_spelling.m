function corrected = py_spelling(sentence)
% py_spelling() Performs basic spelling correction on a sentence
%    NOTE: This calls the Python file 'correct.py'
% INPUTS
%    sentence - String of words separated by spaces
% OUTPUTS
%    corrected - A copy of `sentence` with spelling mistakes fixed

% DOS limits command line call length. Ensure that this is not passed.
if length(sentence) < 6000
    % Command is short enough, so pass through command line
    corrected = python('spelling.py', sentence);
else
    % Command is too long, so pass through a temporary file
    filename = 'output\difference_temp.txt';
    fid = fopen(filename, 'w');
    fprintf(fid, '%s', sentence);
    fclose(fid);
    corrected = python('spelling_long.py', filename);
end

end
