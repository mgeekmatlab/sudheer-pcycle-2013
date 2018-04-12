%%
function[code]=combineab(a1,b1,w)
% combination to 2
[ra1 ca1]=size(a1);
[rb1 cb1]=size(b1);
code1=[];
num=1;
for i=1:ra1
    for j=1:rb1
        c=0;
        for k=1:w
            xx=a1(i,k)+b1(j,k);
            if xx==0
                c=c+1;
            end
            code1{num,2*k-1}=a1(i,k);
            code1{num,2*k}=b1(j,k);
        end
        if c==0
            num=num+1;
        end
        if c>0
            code1(num,:)=[];
        end
    end
end
code=cell2mat(code1);
end
%%
