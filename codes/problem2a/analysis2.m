% analysis problem 2
% first_title�������
% second_title��С����
% subrow, subcol,fig :subplot�Ĳ���
function [data, Class1, Class2, Class3] = analysis2(...
    first_title, second_title, subrow, subcol, fig)
if nargin == 2
    subrow = 1;
    subcol = 1;
    fig = 1;
end
Class1 = [];
Class2 = [];
Class3 = [];
% �����ļ�
problem = [num2str(first_title), second_title];
load([problem, '.mat']);
% ��/��
if ~exist('data', 'var')
    data = [];
    return;
end
[row, col] = size(data);
% ������ʾ
figure;
subplot(1, 2, 1);
switch row
    case 2,
        plot(data(1, :), data(2, :), '.');
    case 3,
        plot3(data(1, :), data(2, :), data(3, :), '.');
end
title('ԭʼ����');
% ��׼������
MatrixOfDist = pdist(data');
MatrixOfDist = squareform(MatrixOfDist);
subplot(1, 2, 2);
imshow(MatrixOfDist, []);
title('���ϵ��');
% ʹ�ó���/��ͳ�����㷨
Ct = clusterdata(data', 'linkage','ward','maxclust', row);
for i = 1 : col
    switch Ct(i)
        case 1,
            Class1 = [Class1, data(:, i)];
        case 2,
            Class2 = [Class2, data(:, i)];
        case 3,
            Class3 = [Class3, data(:, i)];
    end
end
figure;
hold on;
subplot(subrow, subcol, fig);
switch row
    case 2,
        plot(Class1(1, :), Class1(2, :), 'r*');
        plot(Class2(1, :), Class2(2, :), 'g.');
        L1 = ['1��:', num2str(size(Class1, 2)), '��'];
        L2 = ['2��:', num2str(size(Class2, 2)), '��'];
        legend(L1, L2, 'Location', 'Best');
    case 3,
        plot3(Class1(1, :), Class1(2, :), Class1(3, :), 'r*');
        plot3(Class2(1, :), Class2(2, :), Class2(3, :), 'g.');
        plot3(Class3(1, :), Class3(2, :), Class3(3, :), 'b>');
        L1 = ['1��:', num2str(size(Class1, 2)), '��'];
        L2 = ['2��:', num2str(size(Class2, 2)), '��'];
        L3 = ['3��:', num2str(size(Class3, 2)), '��'];
        legend(L1, L2, L3, 'Location', 'Best');
        zlabel('z');
end
xlabel('x');
xlabel('y');
title([problem, ':traditional clustering']);
set(gcf, 'Position', [3, 30, 600, 400]);
saveas(gcf, ['problem', problem], 'jpg');