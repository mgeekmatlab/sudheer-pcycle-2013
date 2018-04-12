clc
clear all
close all
%% define network in this part
links=[1,2;1,8;1,10;1,11;2,3;2,7;3,4;3,5;4,5;5,6;6,7;7,8;8,9;9,10;8,11;11,12];
weight=[3;3;4;7;2;6;2;2;3;4;2;3;4;1;2;2];
%%network2
% links=[1,2;1,8;1,10;1,11;2,3;2,7;3,4;3,5;4,5;5,6;5,12;6,7;7,8;8,9;9,10;8,11;11,12];
% weight=[3;3;4;7;2;6;2;2;3;4;2;3;4;1;2;2;3];
%% define network in this part ends

[noofnodes,matrix,linkrows,rowweight,net,weightmatrix]=newnet(links,weight);
plotnet(noofnodes,matrix,5,rowweight);
[path,result]=bfsmain(matrix,linkrows);
[result,cycle]=storeresult(result,matrix,path);
unprotectedlink=[];
unprotectedlinkno=[];
selectedcycle1=[];
for i=1: length(result)
    if numel(result(i).selectedcycleno)==0
        unprotectedlink=[unprotectedlink;result(i).link];
        unprotectedlinkno=[unprotectedlinkno,result(i).lno];
    elseif numel(result(i).selectedcycleno)>0
        selectedcycle1=[selectedcycle1,result(i).selectedcycleno];
    end
end
unprotectedlinkno;
unprotectedlink;
selectedcycle=unique(selectedcycle1);
final1=cycle(selectedcycle);
[result]=saveresult(cycle,result,final1,unprotectedlinkno,unprotectedlink);

