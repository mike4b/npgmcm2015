% Problem 1
% 1.���ӿռ����ʱ���ӿռ��������������ס�����һ��1.mat ����һ���ά���ݣ�.mat
% ��������ÿ��Ϊһ�����ݵ㣬���¸������ˣ����������������������ӿռ䡣������
% Ҫ���������ݷֳ����ࡣ
%
close all;
load('1.mat');
% ��/��
[row, col] = size(data);
% ������ʾ
figure;
subplot(1, 2, 1);
imshow(data, []);
title('ԭʼ����');
% ��׼������
data = zscore(data);
SaveMatrixAs(data, 'problem1-1.jpg');
% �������
Dist = pdist(data');
MatrixOfDist = squareform(Dist);
SaveMatrixAs(MatrixOfDist, 'problem1-2.jpg');
subplot(1, 2, 2);
imshow(MatrixOfDist, []);
title('���ϵ��');
% �������֮�������
Lkg = linkage(Dist);
% ���۾�����Ϣ
Cn = cophenet(Lkg, Dist);
% �������࣬��������ϵͼ
Ct = clusterdata(data', 'linkage','ward','maxclust', 2);
figure;
plot(1:col, Ct, '+');
xlabel('index');
ylabel('class id');
set(gca, 'ytick',1:2);
title('cluster result');
figure;
dendrogram(Lkg);
Result = reshape(Ct, 20, [])';
xlswrite('problem1.xls', Result);