function[pathout,result]=bfsmain(m,linkrows)
%%path=bfsmain(matrix,linkrows)
[r,c]=size(m);
path{r}=[];
result.link=[];
xx=0;
for i=1:r
    for j=i:c
        if m(i,j)==1
            xx=xx+1;
            result(xx).lno=xx;
            result(xx).link=[i,j];
            i;
            j;
            linkleft=setdiff(linkrows,[i,j;j,i],'rows');
            [mata,matb]=bfsfn(m,i,j);
            [r1,c1]=size(mata);
            for ii=2:c1
                ax=mata{ii};
                bx=matb{ii};
                [rax,cax]=size(ax);
                [rbx,cbx]=size(bx);
                for iii=1:rax
                    for jjj=1:rbx
                        x=ax(iii,:);
                        y=bx(jjj,:);
                        linknode=findlink(x,y,m,linkleft);
                        if numel(linknode)>0
                            path1=connectpath(x,y,linknode);
                            path{length(path1)}=[path{length(path1)};path1];
                            result(xx).path{length(path1)}=path1;
                            result(xx).standardpath{length(path1)}=selectunique(path1);
                        end
                        
                        linknode=findlink(x,y,m,linkleft,1);
                        if numel(linknode)>0
                            path1=connectpath(x,y,linknode);
                            path{length(path1)}=[path{length(path1)};path1];
                            result(xx).path{length(path1)}=path1;
                            result(xx).standardpath{length(path1)}=selectunique(path1);
                        end
                    end
                    
                end
            end
        end
    end
end
for i=3:length(path)
    path{i}=unique(path{i},'rows');
    [pathout{i}]=selectunique(path{i});
end
end

