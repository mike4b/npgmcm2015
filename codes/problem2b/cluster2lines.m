function [Class1, NewClass2] = cluster2lines(lines, AngLim, absLim)
% ���ܣ��ָ�����ֱ��
% lines:ֱ������
% AngLim:�ɵ�����<90
% absLim:�ɵ�����<1.0

close all;
clc;

if nargin == 1
    AngLim = 5;
    absLim = 0.1;
elseif nargin == 2
    absLim = 0.1;
end

[dim, num] = size(lines);

MaxIt = 1000;%����������
Class1Num = 0;
Class2Num = 0;
MinNuNum = num / 3;%�����С���ݸ���

k = 0;
while k < MaxIt && (Class1Num < MinNuNum || Class2Num < MinNuNum)
    Class1 = [];
    Class2 = [];
    % step 1����ȡ������x,y������������1
    % �� = x - y
    id = zeros(1, 2);
    while id(1) == id(2)
        id = unidrnd(num, [1, 2]);
    end
    x = lines(:, id(1));
    y = lines(:, id(2));
    delta = x - y;
    % step 2���������е�z,��1 = z - x,��2 = z - y
    % �жϼн�<��1, ��2>
    for i = 1:num
        z = lines(:, i);
        delta1 = z - x;
        delta2 = z - y;
        flag1 = VectorAngle(delta, delta1);
        flag2 = VectorAngle(delta, delta2);
        if flag1 < AngLim && flag2 < AngLim
            Class1 = [Class1, lines(:, i)];
        else
            Class2 = [Class2, lines(:, i)];
        end
    end
    % step3�����¼�������������ݸ���
    Class1Num =  size(Class1, 2);
    Class2Num =  size(Class2, 2);
    k = k + 1;
end
if k == MaxIt
    return;
end

figure;
switch dim
    case 2,
        plot(Class1(1, :), Class1(2, :), 'ro');
        hold on;
        plot(Class2(1, :), Class2(2, :), 'b.');
    case 3,
        plot3(Class1(1, :), Class1(2, :), Class1(3, :),  'ro');
        hold on;
        plot3(Class2(1, :), Class2(2, :), Class2(3, :), 'b.');
        zlabel('z');
end
xlabel('x');
ylabel('y');
title('cluster result');

para = polyfit(Class1(1, :), Class1(2, :), 1);
NewClass2 = [];
for i = 1:Class2Num
    xi = Class2(1, i);
    yi = polyval(para, xi);
    dy = (Class2(2, i) - yi) / yi;
    if abs(dy) < absLim
        Class1 = [Class1, Class2(:, i)];
    else
        NewClass2 = [NewClass2, Class2(:, i)];
    end
end

figure;
switch dim
    case 2,
        plot(Class1(1, :), Class1(2, :), 'ro');
        hold on;
        plot(NewClass2(1, :), NewClass2(2, :), 'b.');
    case 3,
        plot3(Class1(1, :), Class1(2, :), Class1(3, :), 'ro');
        hold on;
        plot3(NewClass2(1, :), NewClass2(2, :), NewClass2(3, :), 'b.');
        zlabel('z');
end
xlabel('x');
ylabel('y');
title('cluster result');

% ��������֮��ļнǣ�������
function ang = VectorAngle(vec1, vec2)
ang = acos(dot(vec1, vec2) / (norm(vec1) * norm(vec2))) * 180 / pi;