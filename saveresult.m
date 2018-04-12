function[result]=saveresult(cycle,result,final1,u1,u2)
%%[result]=saveresult(cycle,result)
if exist('result.txt','file')
    delete('result.txt')
end
diary('result.txt')
clc
disp('__________________________________________________')
disp('__________________________________________________')
disp('CYCLE')
for i=1:length(cycle);disp(cycle(i)), end
disp('__________________________________________________')
disp('__________________________________________________')
disp('RESULT')
for i=1:length(result);disp(result(i)), end
disp('__________________________________________________')
disp('__________________________________________________')
disp('Final unique cycles')
for i=1: length(final1)
    disp(final1(i))
end
disp('__________________________________________________')
disp('__________________________________________________')
disp('unprotected links')
disp('link no')
disp(u1)
disp('link ')
disp(u2)
disp('__________________________________________________')
disp('__________________________________________________')
diary off
clc
open('result.txt')
saveas(gcf,'result.jpg','jpg')
end