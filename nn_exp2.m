% Solve an Input-Output Fitting problem with a Neural Network
% Script generated by Neural Fitting app
% Created 01-Sep-2020 15:16:46
%
% This script assumes these variables are defined:
%
%   y1 - input data.
%   x - target data.

%inp = y1234';
%t = x';
res=zeros(35,6);


for nos=[3]
    C = C_best{nos};
   % C=[2,3,6];
    % C = C_worst{nos};
    for kk=1
        
        
        
        
        inp =sens(C(kk,:),:);
        t = centroids(:,:);
        
        % Choose a Training Function
        % For a list of all training functions type: help nntrain
        % 'trainlm' is usually fastest.
        % 'trainbr' takes longer but may be better for challenging problems.
        % 'trainscg' uses less memory. Suitable in low memory situations.
        trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
        
        % Create a Fitting Network
        hiddenLayerSize = 60;
        net = fitnet(hiddenLayerSize,trainFcn);
        
        % Choose Input and Output Pre/Post-Processing Functions
        % For a list of all processing functions type: help nnprocess
        net.input.processFcns = {'removeconstantrows','mapminmax'};
        net.output.processFcns = {'removeconstantrows','mapminmax'};
        
        % Setup Division of Data for Training, Validation, Testing
        % For a list of all data division functions type: help nndivision
        net.divideFcn = 'dividerand';  % Divide data randomly
        net.divideMode = 'sample';  % Divide up every sample
        net.divideParam.trainRatio = 70/100;
        net.divideParam.valRatio = 15/100;
        net.divideParam.testRatio = 15/100;
        
        % Choose a Performance Function
        % For a list of all performance functions type: help nnperformance
        net.performFcn = 'mse';  % Mean Squared Error
        
        % Choose Plot Functions
        % For a list of all plot functions type: help nnplot
        net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
            'plotregression', 'plotfit'};
        
        % Train the Network
        [net,tr] = train(net,inp,t);
        
        % Test the Network
        out = net(inp);
        e = gsubtract(t,out);
        performance = perform(net,t,out)
        
     
        
        %k=k+1;
        
    end
subplot(1,2,1)
 plot(out(1,:))
 hold on
% plot(t(1,:),'r')
 
 subplot(1,2,2)
 plot(out(2,:))
 hold on
% plot(t(2,:),'r')
 

 
% plot(t(1,:),'r')
%plot(movmean(e(1,:),50))
%hold on
end
% figure;
% plot(out)
% hold on
% plot(t)
% 
% 
% for nos=1:6
%        [val,idx]=max(res(:,nos));
%    C_worst{nos}=C_all{nos}(idx,:);
% %           [val,idx]=min(res(:,nos));
% %    C_best{nos}=C_all{nos}(idx,:);
%    
%    
% end
% 
% 
% for i=1:21
%     res2D(C_all{2}(i,1)-1,C_all{2}(i,2)-1)=res(i,2);
% end
% 
% for i=1:7
%     res2D(C_all{1}(i,:)-1,C_all{1}(i,:)-1)=res(i,1);
% end
% 
% 
% res2=res;
% i=1;
% 
% while max(max(res2))>0
%     [val]=max(max(res2));
%     
%     [row,col]=find(res2==val);
%     res2(row,col)=0;
%     rk([C_all{col}(row,:)],i)=1;
%     i=i+1;
% end
% 
% 
% res3=res;
% res3(res3==0)=100;
% for nos=1:6
%        [val,idx]=sort(res3(:,nos));
%    C_ordered{nos}=C_all{nos}(idx(1:7),:);
%    val_best(nos)=val(1);
% %           [val,idx]=min(res(:,nos));
% %    C_best{nos}=C_all{nos}(idx,:);
%    
%    
% end
