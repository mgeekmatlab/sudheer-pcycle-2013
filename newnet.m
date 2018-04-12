function[noofnodes,matrix,linkrows,rowweight,net,weightmatrix]=newnet(links,weight)
%[noofnodes,matrix,linkrows,rowweight,net]=newnet(links,weight)
linkrows=unique(cat(1,links,fliplr(links)),'rows');
[r,c]=size(links);
[r2,c2]=size(linkrows);
rowweight=zeros(r2,1);
% weight=rowweight
for i=1:r
    for j=1:r2
        if links(i,:)==linkrows(j,:)|links(i,:)==fliplr(linkrows(j,:))
%             if exist('weight(i,:)','var')==0
%                 weight(i,:)=0;
%             end
            rowweight(j,:)=weight(i,:);
        end
    end
end
%[noofnodes,matrix]=newnet(links,weight)
noofnodes=numel(unique(links));
n=noofnodes;
matrix=zeros(n,n);
weightmatrix=matrix;
for i=1:r
    matrix(links(i,1),links(i,2))=1;
    matrix(links(i,2),links(i,1))=1;
    weightmatrix(links(i,1),links(i,2))=weight(i,1);
    weightmatrix(links(i,2),links(i,1))=weight(i,1);
end
   
net.node=[];
net.edge=[];
for i=1:n
    net(i).node=i;
    net(i).edge=find(matrix(i,:)==1);
end

    
        



