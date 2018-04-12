
function[path]=connectpath(x,y,linknode)
x=fliplr(x);
y=fliplr(y);
[rx,cx]=size(x);
[ry,cy]=size(y);
l=linknode;
if length(l)==1
    a=find(x(:,1)==l);
    b=find(y(:,1)==l);
    a1=fliplr(x(a,:));
    b1=y(b,2:cy);
    path=[a1,b1];
else
    a=find(x(:,1)==l(1,1));
    b=find(y(:,1)==l(1,2));
    a1=fliplr(x(a,:));
    b1=y(b,:);
    path=[a1,b1];
end
end
%%
