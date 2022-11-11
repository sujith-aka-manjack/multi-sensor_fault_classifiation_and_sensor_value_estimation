tic
master; %This is a script which extracts the 4 features and transforms it into a 2-dimentional feature vector through PCA
% fault1 = z(:,1:50)';
% fault2 = z(:,51:100)';
% fault3 = z(:,101:151)';
% fault4 = z(:,151:200)';
% fault5 = z(:,201:250)';
k=1; %The value of k is set here. Preferabily an odd number
train_data_no = 35; %No of samples in training data for each defect type
test_data_no = length(fault1)-train_data_no; %No of samples in test data for each defect type
%The first m rows of each defect assigned as the training dataset and remaining (N-m) rows as test dataset.
trainingSet = [fault1(1:train_data_no,:); fault2(1:train_data_no,:); fault3(1:train_data_no,:); fault4(1:train_data_no,:); fault5(1:train_data_no,:)];
testingSet = [fault1(train_data_no+1:end,:); fault2(train_data_no+1:end,:); fault3(train_data_no+1:end,:); fault4(train_data_no+1:end,:); fault5(train_data_no+1:end,:)];
%The training and test datasets are assigned with their actual class labels [1-5]
trainingTarget = [ones(1,train_data_no), ones(1,train_data_no)*2, ones(1,train_data_no)*3, ones(1,train_data_no)*4, ones(1,train_data_no)*5];
testingTarget = [ones(1,test_data_no), ones(1,test_data_no)*2, ones(1,test_data_no)*3, ones(1,test_data_no)*4, ones(1,test_data_no)*5];
%The total no of datapoints in training and test data is calculated
total_test_data = test_data_no * 5;
total_train_data = train_data_no * 5;
% Preallocating variables for faster processing
inferredLabels = zeros(1, total_test_data);
dist = zeros(total_test_data,total_train_data);
% This loop cycles through each unlabelled item i.e the test data
for unlabelledCaseIdx = 1:total_test_data
    unlabelledCase = testingSet(unlabelledCaseIdx, :);
    % This loop cycles through each labelled item i.e the training data
    for labelledCaseIdx = 1:total_train_data
        labelledCase = trainingSet(labelledCaseIdx, :);
        % Calculate the Euclidean distance for all training samples for the
        % given test data
        dist(unlabelledCaseIdx,labelledCaseIdx) = norm(unlabelledCase - labelledCase);
    end % end of inner loop
    %Return the value and intex of the least k distances
    [B I] = mink(dist(unlabelledCaseIdx,:),k); 
    % Assign the most frequent label to the test data
    inferredLabels(unlabelledCaseIdx) = mode(trainingTarget(I));
end % end of outer loop
%Classification accuracy is calculated
acc = 100*length(find(inferredLabels==testingTarget))/length(testingTarget);
%Accuracy is displayed to the user
x = ['the accuracy = ',num2str(acc),' for k = ', num2str(k)];
disp(x);
toc;