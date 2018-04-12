function[out]=selectunique(code)
out1=[];
out2=[];
out=[];
[r,c]=size(code);
for i=1:r
    x=code(i,:);
    m=min(x);
    a=find(x==m);
    x=circshift(x',-(a-1))';
    out1(i,:)=x;
end

for i=1:r
    x=out1(i,:);
    y=x(1,2:c);
    a=x(1,2);
    b=x(1,c);
    m=min([a,b]);
    if m==b
        y=fliplr(y);
    end
    out2(i,:)=[x(1,1),y];
end
out=unique(out2,'rows');
end
% % test for case like [4,7,6,7] & [6,7,5,7]
% % & select remove it if it is not standard
% % out=1 for fail condition remove code
% % out =0 condition pass keep the code
% n=sum(code);
% w=length(code);
% no=1;
% num=1;
% for i=1:w-1
%     if code(1,i)==code(1,w)
%         no=no+1;
%         shift(1,num)=i;
%         num=num+1;
%     end
% end
% test=zeros(no,w);
% num=1;
% for j=1:no
%     if j==1
%         test(num,:)=code;
%         num=num+1;
%     end
%     if j >1
%         x3=[];
%         x3=(circshift(code',-shift(1,j-1))');
%         x4=code-x3;
%         x5=x4*x4';
%         if x5~=0
%             test(num,:)=x3;
%             num=num+1;
%         end
%     end
% end
% col=1;
% repeat=1;
% [r,c]=size(test);
% while r>1
%     [r,c]=size(test);
%     if r>1
%         test=sortrows(test,col);
%         num=1;
%         for i=1:r
%             if test(1,col)==test(i,col)
%                 test2(num,:)=test(i,:);
%                 num=num+1;
%             end
%         end
%         test=[];
%         test=test2;
%         test2=[];
%         col=col+1;
%     end
%     if r==1
%         repeat=2;
%         break
%     end
% end
% x=test-code;
% x2=sum(x*x');
% if x2==0
%     out=0;
% end
% if x2~=0
%     out=1;
% end
% end
% %%
