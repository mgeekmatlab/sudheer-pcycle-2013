%%
function[linknode]=findlink(x,y,matrix,linkleft,searchlinkfirst)
if nargin==4
    searchlinkfirst=1;
end
linknode=[];
x=fliplr(x);
y=fliplr(y);
in=intersect(x(:,1),y(:,1));
in2=intersect(x,y);
if numel(in2)>2
    return
end
switch searchlinkfirst
    case 1
        if numel(in)~=0&&numel(in2)<2
            linknode=in;
%             return
        end
        if numel(linknode)==0&&numel(in2)==0
            tl=combineab(x(:,1),y(:,1),1);
            linknode=intersect(tl,linkleft,'rows');
%             return
        end    
    otherwise
        if numel(linknode)==0&&numel(in2)==0
            tl=combineab(x(:,1),y(:,1),1);
            linknode=intersect(tl,linkleft,'rows');
%             return
        end    
        if numel(in)~=0&&numel(in2)<2
            linknode=in;
%             return
        end
end
end
