function[mata,matb]=bfsfn(m,a,b)
%%[mata,matb]=bfsfn(m,a,b,links)
[r,c]=size(m);
lim=ceil(r/2);
m(:,a)=0;
m(:,b)=0;
ma=m;
mb=m;
% ma(:,a)=0;
% mb(:,b)=0;
amat=[];
for i=1:lim
    if numel(a)==0||numel(b)==0||sum(sum(ma))==0||sum(sum(mb))==0
        breakchk=1;
        break
    end
    if i==1
        row=a;
        rowb=b;
    end
    
    for j=1:numel(a)
        if j==1
            mat{i+1}=[];
            ax1=[];
        end
        if i>1
            row=amat(j,:);
        end
        ax=find(ma(a(j,1),:)==1);
        amat1=[ones(numel(ax),1)*row,ax'];
        
        mat{i+1}=[mat{i+1};amat1];
        ax1=[ax1,ax];
%         ma(:,ax1)=0
    end
    ma(:,ax1)=0;
    amat=mat{i+1};      
    [r1,c1]=size(amat);
    a=amat(:,c1);
    mat{i+1}=amat;
    
%     mb=ma;
    
    
    
    for j=1:numel(b)
        if j==1
            matb{i+1}=[];
            bx1=[];
        end
        if i>1
            rowb=bmat(j,:);
        end
        bx=find(mb(b(j,1),:)==1);
        bmat1=[ones(numel(bx),1)*rowb,bx'];
        
        matb{i+1}=[matb{i+1};bmat1];
        bx1=[bx1,bx];
%         ma(:,ax1)=0
    end
    mb(:,bx1)=0;
    bmat=matb{i+1};      
    [r2,c2]=size(bmat);
    b=bmat(:,c2);
    matb{i+1}=bmat;
%     amat=[];
%     ma=mb;
end
mata=mat;
end