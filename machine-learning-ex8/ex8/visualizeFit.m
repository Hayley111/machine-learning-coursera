function visualizeFit(X, mu, sigma2)
%VISUALIZEFIT Visualize the dataset and its estimated distribution.
%   VISUALIZEFIT(X, p, mu, sigma2) This visualization shows you the 
%   probability density function of the Gaussian distribution. Each example
%   has a location (x1, x2) that depends on its feature values.
%
sigma3=cov(X);
[X1,X2] = meshgrid(0:.5:35); 
% Z = multivariateGaussian([X1(:) X2(:)],mu,sigma2);
Z1= multivariateGaussianCov([X1(:) X2(:)],mu,sigma3);
% Z = reshape(Z,size(X1));
Z1= reshape(Z1,size(X1));

plot(X(:, 1), X(:, 2),'bx');
hold on;
% Do not plot if there are infinities
if (sum(isinf(Z1)) == 0)
    contour(X1, X2, Z1, 10.^(-20:3:0)');
end
hold off;

end