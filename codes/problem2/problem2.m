% Problem 2
% �ô�ͳ������������о��ࡣ
% 2.������������ĸ���ά�ռ��е��ӿռ��������Ͷ����ξ������⣬��ͼ1��ʾ��ͼ1(a)
% Ϊ�������㲻��ԭ���һ��ഹֱ������ֱ�ߣ������Ϊ���ࣻͼ1(b) Ϊһ��ƽ�������
% ֱ�ߣ�����һ������������ӿռ�Ĺ�ϵ�����ӣ������Ϊ���ࡣͼ1(c)Ϊ�������ཻ��
% �������ߣ������Ϊ���ࡣͼ1(d) Ϊ�����ཻ�������ߣ������Ϊ���ࡣ
%
clear all;
close all;
clc;
[~, Class2a1, Class2a2, Class2a3] = analysis2(2, 'a');
[~, Class2b1, Class2b2, Class2b3] = analysis2(2, 'b');
[~, Class2c1, Class2c2, Class2c3] = analysis2(2, 'c');
[~, Class2d1, Class2d2, Class2d3] = analysis2(2, 'd');

figure;

subplot(2, 2, 1);
hold on;
plot(Class2a1(1, :), Class2a1(2, :), 'r*');
plot(Class2a2(1, :), Class2a2(2, :), 'g.');

subplot(2, 2, 2);
hold on;
plot3(Class2b1(1, :), Class2b1(2, :), Class2b1(3, :), 'r*');
plot3(Class2b2(1, :), Class2b2(2, :), Class2b2(3, :), 'g.');
plot3(Class2b3(1, :), Class2b3(2, :), Class2b3(3, :), 'b>');

subplot(2, 2, 3);
hold on;
plot(Class2c1(1, :), Class2c1(2, :), 'r*');
plot(Class2c2(1, :), Class2c2(2, :), 'g.');

subplot(2, 2, 4);
hold on;
plot(Class2d1(1, :), Class2d1(2, :), 'r*');
plot(Class2d2(1, :), Class2d2(2, :), 'g.');