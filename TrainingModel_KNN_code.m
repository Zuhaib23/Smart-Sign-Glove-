% Load Data from Text File
filename = 'Meds.txt'; % Replace with your file name
if exist(filename, 'file') ~= 2
    error('File "%s" does not exist. Please check the file name and path.', filename);
end

% Step 1: Read file content
fid = fopen(filename, 'r');
fileData = fread(fid, '*char')'; % Read file content as text
fclose(fid);

% Step 2: Parse the data into lines
dataLines = regexp(fileData, '\r?\n', 'split'); % Split text into lines using newline character
dataLines = dataLines(~cellfun('isempty', dataLines)); % Remove empty lines
numSamples = numel(dataLines); % Count the number of data lines

% Step 3: Dynamically detect sensor labels from the first line
headerTokens = regexp(dataLines{1}, '\w+:', 'match'); % Extract labels (e.g., Thumb:, Index:, ...)
if isempty(headerTokens)
    error('No sensor labels found in the first line. Please check the data format.');
end
sensorLabels = strrep(headerTokens, ':', ''); % Remove colons from labels
numSensors = numel(sensorLabels); % Count the number of sensors

% Step 4: Preallocate matrix for storing sensor values
samples = zeros(numSamples, numSensors);

% Step 5: Process each line to extract sensor values
for i = 1:numSamples
    line = dataLines{i};
    % Match the pattern for sensor values dynamically based on detected labels
    tokens = regexp(line, ['(?:' strjoin(sensorLabels, '|') '):\s*(-?\d+)'], 'tokens');

    if numel(tokens) == numSensors
        % Convert tokens to numeric values and store them
        samples(i, :) = str2double([tokens{:}]);
    else
        % Warn about lines that do not match the expected format
        warning('Line %d does not match the expected format and will be skipped: %s', i, line);
    end
end

% Remove rows with all zeros (if any invalid lines were skipped)
samples = samples(any(samples, 2), :);

% Step 6: Remove highly deviated values
meanVals = sum(samples, 1) ./ sum(~isnan(samples), 1); % Calculate mean for each sensor column ignoring NaNs
stdVals = sqrt(sum((samples - repmat(meanVals, size(samples, 1), 1)).^2, 1) ./ (sum(~isnan(samples), 1) - 1)); % Calculate standard deviation ignoring NaNs
dynamicThreshold = 2 * stdVals; % Set dynamic threshold as twice the standard deviation

% Identify and filter out rows with highly deviated values
isWithinThreshold = all(abs(samples - repmat(meanVals, size(samples, 1), 1)) <= repmat(dynamicThreshold, size(samples, 1), 1), 2);
filteredSamples = samples(isWithinThreshold, :);

% Display results
fprintf('Data after filtering highly deviated values:\n');
disp(filteredSamples);

% Step 7: Calculate final mean and threshold values
finalMean = sum(filteredSamples, 1) ./ sum(~isnan(filteredSamples), 1); % Final mean ignoring NaNs
finalThreshold = dynamicThreshold; % Threshold remains the same after filtering

% Display the final mean and threshold values
fprintf('Final Mean Values for Each Sensor:\n');
disp(array2table(finalMean, 'VariableNames', sensorLabels));

fprintf('Dynamic Threshold Values for Each Sensor:\n');
disp(array2table(finalThreshold, 'VariableNames', sensorLabels));

% Step 8: Save mean and threshold values for further use
gestureModel.meanVals = finalMean; % Mean of filtered samples
gestureModel.threshold = finalThreshold; % Threshold values
save('gestureModel.mat', 'gestureModel'); % Save the model parameters

fprintf('Model saved successfully to "gestureModel.mat".');
