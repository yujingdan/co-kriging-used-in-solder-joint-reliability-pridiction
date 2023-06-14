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
%% initial
addpath('../Example Problems');
addpath('../Advanced Concepts');


load('D:\documents 2023\CODE\Website Code March 10 三维v3\data4.mat')


global ModelInfo

% ModelInfo.Xe=HIGH([1:25],[1:3]);
% 
% ModelInfo.Xc=LOW([1:50],[1:3]);
% k=3;
% ModelInfo.ye=HIGH([1:25],4);
% ModelInfo.yc=LOW([1:50],4);
ModelInfo.test=test(:,:);
    ModelInfo.Thetac=ga(@likelihoodc,k,[],[],[],[],[-5 -8 -8],[5 8 8]);
    ModelInfo.Thetae=ga(@likelihoode,k,[],[],[],[],[-8 -8 -8],[8 8 8]);
newvar=[];
y_new=[];
iter=0;
crit=1;
histy=[];
histx=[];
histcrit=[];
% %% sequential
% while crit>0.0001
%    ModelInfo.Xe=[ModelInfo.Xe;newvar];
%    ModelInfo.ye=[ModelInfo.ye;y_new];
%     Params=[];
%     ModelInfo.Thetad=[];
%     ModelInfo.rho=[];
%     Params=ga(@likelihoodd,k+1,[],[],[],[],[-8 -8 -8 -8],[8 8 8 8]);
%     ModelInfo.Thetad=Params(1:3);
%     ModelInfo.rho=Params(4);
%     % Construct covariance matrix
%     buildcokriging
% 
%     ModelInfo.Option='RMSE';
% 
%     for i=1:14
%             P(i)=cokrigingpredictor(test(i,(1:3)));
%              Q(i,:)=[i P(i)];
%     end
%     variance=mse(P)
%     ModelInfo.Option='NegLogExpImp'
%     [newvar,ei]=ga(@cokrigingpredictor,3,[],[],[],[],[0.4 1.5 0.3],[0.7 2 0.75]);
%     crit= abs(ei /ModelInfo.yBest );
%     ModelInfo.Option='Pred'
%     y_new=cokrigingpredictor(newvar);
%      fprintf( [sprintf(['[%3.0i]    %6.2e    %6.2e       (',...
%                 repmat('%.6g ',1,3),'\b)'],...
%                 iter, ModelInfo.yBest, crit, newvar), '\n'] )
%     iter=iter+1;
%     histx=[histx;newvar];
%     histy=[histy;y_new];
%     histcrit=[histcrit;crit];
% end

   ModelInfo.Option='Pred'
    for i=1:14
            rr(i)=cokrigingpredictor(test(i,(1:3)))
             Q(i,:)=[i rr(i)];
    end
  test_error = (test((1:13),4) - rr')

test_mse = mse(test_error)
% test_error = (test((1:13),4) - P')./test((1:13),4)
% 
% test_mse = mse(test_error)
%  plot(Q(:,1),P,'ko',Q(:,1),test((1:13),4),'go',Q(:,1),test_error,'r*')
% legend('预测值','真实值','相对误差')
% ModelInfo.Option='NegLogExpImp'
% newvar=ga(@cokrigingpredictor,3,[],[],[],[],[0.8 1.5 0.4],[1.4 2 0.75]);
% plot3(ModelInfo.Xe(:,1),ModelInfo.Xe(:,2),ModelInfo.ye,'ko',ModelInfo.Xc(:,1),ModelInfo.Xc(:,2),ModelInfo.yc,'go');
% hold on
% plot3(ModelInfo.Xe(:,1),ModelInfo.Xe(:,2),P,'ro',ModelInfo.Xe(:,1),ModelInfo.Xe(:,2),test_error,'r*');
% TYU=ga(@cokrigingpredictor,k,[],[],[],[],[0.4 0.4 1.5],[0.75 0.75 2])


