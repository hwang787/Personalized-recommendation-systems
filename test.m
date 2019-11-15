clear;

% Use real data:
load ('movie_data');
rateMatrix = train;
testMatrix = test;
%rateMatrix = [1 2 3; 4 5 6; 7 8 10];
%testMatrix = [1 2 3; 4 5 6; 7 8 10];
% Global SVD Test:
lowRank = [1, 3, 5, 7, 9];
for l=1:size(lowRank, 2)
    tic;
    [U, V] = myRecommender(rateMatrix, lowRank(l));
    logTime = toc;
    
    trainRMSE = norm((U*V' - rateMatrix) .* (rateMatrix > 0), 'fro') / sqrt(nnz(rateMatrix > 0));
    testRMSE = norm((U*V' - testMatrix) .* (testMatrix > 0), 'fro') / sqrt(nnz(testMatrix > 0));
    
    fprintf('SVD-%d\t%.4f\t%.4f\t%.2f\n', lowRank(l), trainRMSE, testRMSE, logTime);
end
