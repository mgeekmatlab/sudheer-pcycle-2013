function[result]=selectpath(result,cycle)
for i=1:length(result)
    if numel(result(i).er)>0
        a=find(result(i).er==max(result(i).er));
        result(i).selectedcycleno=result(i).cycleno(1,a);
        result(i).selectedpath=cycle(result(i).selectedcycleno).path;
        result(i).maxER=max(result(i).er);
    end
end
end