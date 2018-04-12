function[er]=ercalc(a,mat)
if numel(a)==0
    er=0;
    return
end
b=nchoosek(a,2);
n=length(a);
[r,c]=size(b);
p=0;
for i=1:r    
    if mat(b(i,1),b(i,2))==1
        p=p+1;
    end
end
er=p/n;
end

