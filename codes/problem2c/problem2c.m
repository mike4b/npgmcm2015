%problem 2c
clear;
clc;
load('2c.mat');
result = smmc(data, 2, 1, 2)';
% ������ͼ
y1 = [];
y2 = [];
for i = 1:size(data, 2)
    if result(i) == 1
        y1 = [y1, data(:,i)];
    else
        y2 = [y2, data(:,i)];
    end
end
figure;
plot(y1(1, :), y1(2, :), 'm^');
hold on;
plot(y2(1, :), y2(2, :), 'cx');
xlabel('x');
ylabel('y');
title('problem 2c');
L1 = ['1��:', num2str(size(y1, 2)), '��'];
L2 = ['2��:', num2str(size(y2, 2)), '��'];
legend(L1, L2, 'Location', 'Best');