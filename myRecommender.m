function [ U, V ] = myRecommender( rateMatrix, lowRank )
    % Please type your name here:
    name = 'Hanchen Wang';
    disp(name); % Do not delete this line.

    % Parameters
    maxIter = 100; % Choose your own.
    learningRate = 0.001; % Choose your own.
    regularizer = 0.00001; % Choose your own.
    
    % Random initialization:
    [n1, n2] = size(rateMatrix);
    U = rand(n1, lowRank) / lowRank;
    V = rand(n2, lowRank) / lowRank;
    % Estimated matrix:
    Est_matrix = U*(transpose(V));
    % Error matrix:
    rateMatrix(isnan(rateMatrix))=0;
    Est_matrix(rateMatrix==0)=0;
    
    Err_matrix = Est_matrix - rateMatrix;
    
    iteration =1;
    while sum(sum(Err_matrix.^2))+regularizer*sum(sum(U.^2))+regularizer*sum(sum(V.^2))> 0.00001
        
        if(iteration > maxIter)
            break;
        end
        
        
    
        % Gradient Descent:
        
        U_d = learningRate*transpose(transpose(V)*transpose(Err_matrix));
        V_d = learningRate*transpose(transpose(U)*Err_matrix);
        
        U = U - U_d;
        V = V - V_d;
        Est_matrix = U*(transpose(V));
        % Error matrix:
        Est_matrix(rateMatrix==0)=0;
        Err_matrix = Est_matrix - rateMatrix;
        iteration = iteration +1;
    
    end
    
    % IMPLEMENT YOUR CODE HERE.
end
