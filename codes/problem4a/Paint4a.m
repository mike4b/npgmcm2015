% ��Բ̨
function Paint4a(y1, y2, y3)
plot3(y1(1, :), y1(2, :), y1(3, :), 'k+');
hold on;
plot3(y2(1, :), y2(2, :), y2(3, :), 'm.');
hold on;
plot3(y3(1, :), y3(2, :), y3(3, :), 'c*');
xlabel('x');
ylabel('y');
zlabel('z');
title('problem 4a');
L1 = ['1��:', num2str(size(y1, 2)), '��'];
L2 = ['2��:', num2str(size(y2, 2)), '��'];
L3 = ['3��:', num2str(size(y3, 2)), '��'];
legend(L1, L2, L3, 'Location', 'Best');