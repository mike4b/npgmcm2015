% Problem 2a
% 2.������������ĸ���ά�ռ��е��ӿռ��������Ͷ����ξ������⣬��ͼ1��ʾ��ͼ1(a)
% Ϊ�������㲻��ԭ���һ��ഹֱ������ֱ�ߣ������Ϊ���ࣻͼ1(b) Ϊһ��ƽ�������
% ֱ�ߣ�����һ������������ӿռ�Ĺ�ϵ�����ӣ������Ϊ���ࡣͼ1(c)Ϊ�������ཻ��
% �������ߣ������Ϊ���ࡣͼ1(d) Ϊ�����ཻ�������ߣ������Ϊ���ࡣ
%
clear all;
close all;
clc;
data = analysis2(2, 'a');
num = size(data, 2);

MaxIt = 1000;%����������
absLim = 0.12;
Class1Num = 0;
Class2Num = 0;
MinNuNum = num / 3;%�����С���ݸ���

it = 0;
while it < MaxIt && (Class1Num < MinNuNum || Class2Num < MinNuNum)
    Class1 = [];
    Class2 = [];
    % step 1����ȡ������(x1,y1),(x2,y2)����������ֱ��L1��kx+b=y
    id = zeros(1, 2);
    while id(1) == id(2)
        id = unidrnd(num, [1, 2]);
    end
    p = data(:, id(1));
    q = data(:, id(2));
    A = [p(1), 1; q(1), 1];
    B = [p(2); q(2)];
    X = A \ B;
    k = X(1);
    b = X(2);
    % step 2���������е�z,��1 = z - x,��2 = z - y
    % �жϼн�<��1, ��2>
    for i = 1:num
        r = data(:, i);
        y = k * r(1) + b;
        flag = abs((y - r(2))/y);
        if flag < absLim
            Class1 = [Class1, data(:, i)];
            % ����k,b
        else
            Class2 = [Class2, data(:, i)];
            if Class2Num >= 2
                % ����k2,b2
            else
                % count++
            end
        end
    end
    % step3�����¼�������������ݸ���
    Class1Num =  size(Class1, 2);
    Class2Num =  size(Class2, 2);
    it = it + 1;
end

if it == MaxIt
    return;
end

figure;
plot(Class1(1, :), Class1(2, :), 'rp');
hold on;
plot(Class2(1, :), Class2(2, :), 'gh');
xlabel('x');
ylabel('y');
title('problem 2a');
L1 = ['1��:', num2str(size(Class1, 2)), '��'];
L2 = ['2��:', num2str(size(Class2, 2)), '��'];
legend(L1, L2, 'Location', 'Best');

%{
para = polyfit(Class1(1, :), Class1(2, :), 1);
NewClass2 = [];
for i = 1:Class2Num
    xi = Class2(1, i);
    yi = polyval(para, xi);
    dy = (Class2(2, i) - yi) / yi;
    if abs(dy) < 0.10
        Class1 = [Class1, Class2(:, i)];
    else
        NewClass2 = [NewClass2, Class2(:, i)];
    end
end
figure;
plot(Class1(1, :), Class1(2, :), 'ro');
hold on;
plot(NewClass2(1, :), NewClass2(2, :), 'b.');
xlabel('x');
ylabel('y');
title('cluster result');
%}