function[result,cycle]=storeresult(result,matrix,path)
[r,c]=size(result);
n=0;
clear cycle
[rr,cc]=size(path);
for i=1:cc 
    if numel(path{i})~=0
        [r,c]=size(path{i});
        for j=1:r 
            n=n+1;
            cycle(n).no=n;
            cycle(n).path=path{i}(j,:);
            cycle(n).ER=ercalc(cycle(n).path,matrix);
        end
    end
end
for j=1:length(result)
result(j).cycleno=[];
end
for i=1:n
    if i==1
        result(i).er=[];
    end
    x=cycle(i).path;
    for j=1:length(result)        
        y1=result(j).standardpath;
        if numel(y1)~=0&&numel(y1)>=length(x)
            y=y1(1,length(x));
            if numel(y{1})~=0
                in=intersect(x,cell2mat(y),'rows');
                if numel(in)==length(x)
                    chk=x-cell2mat(y);
                    chk2=chk*chk';
                    if chk2==0
                        result(j).cycleno=union(result(j).cycleno,i);
                        result(j).er=[result(j).er,ercalc(cycle(i).path,matrix)];%ercalc(cycle(result(j).cycleno).path,matrix)
                    end
                end
            end
        end
    end
end
[result]=selectpath(result,cycle);
end