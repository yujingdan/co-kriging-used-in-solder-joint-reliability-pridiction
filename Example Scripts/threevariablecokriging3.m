% One variable co-Kriging example (similar to Figure 8.1)
%
% Copyright 2007 A I J Forrester
%
% This program is free software: you can redistribute it and/or modify  it
% under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or any
% later version.
% 
% This program is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser
% General Public License for more details.
% 
% You should have received a copy of the GNU General Public License and GNU
% Lesser General Public License along with this program. If not, seez
% <http://www.gnu.org/licenses/>.

addpath('../Example Problems');
addpath('../Advanced Concepts');

load('D:\documents 2023\CODE\Website Code March 10 三维v3\data4.mat')
% 
% rand('state',0)
% randn('state',0)
global ModelInfo
% Expensive points
ModelInfo.Xe=HIGH1([1:45],[1:3]);
% Cheap points
ModelInfo.Xc=LOW(:,[1:3]);
k=3;
ModelInfo.ye=HIGH1([1:45],4);
ModelInfo.yc=LOW(:,4);
% Optimize cheap model paramters
ModelInfo.Thetac=ga(@likelihoodc,k,[],[],[],[],[-5 -5 -5],[5 5 5]);

Params=ga(@likelihoodd,k+1,[],[],[],[],[-8 -8 -8 -8],[8 8 8 8]);
ModelInfo.Thetad=Params(1:3);
ModelInfo.rho=Params(4);
% Construct covariance matrix
buildcokriging

ModelInfo.Option='Pred';

for i=1:13
        P(i)=cokrigingpredictor(test(i,(1:3)));
         Q(i,:)=[i P(i)];
end
test_error = (test((1:13),4) - P');
test_rmse = sqrt(mse(test_error));
rel_err=(test((1:13),4) - P')./test((1:13),4);
 plot(Q(:,1),P,'ko',Q(:,1),test((1:13),4),'go',Q(:,1),test_error,'r*')
legend('预测值','真实值','相对误差')



