function[]=plotnet(noofnodes,matrix,r,linkrowweight)
theta=[0:2*pi/noofnodes:2*pi];
xx=r*sin(theta);
yy=r*cos(theta);
xy=cat(2,xx',yy');
axis([-r-2,r+2,-r-2,r+2])
num=1;
hold on
for i=1:noofnodes
    text(1.2*xy(i,1),1.2*xy(i,2),['*' num2str(i)]);
    for j=i+1:noofnodes
%         text(1.2*xy(j,1),1.2*xy(j,2),['.' num2str(j)]);
        if matrix(i,j)==1
            plot([xx(1,i),xx(1,j)],[yy(1,i),yy(1,j)],'--g')
            
            text(1.1*(xx(1,i)+xx(1,j))/2, 1.1*(yy(1,i)+yy(1,j))/2 ,[num2str(linkrowweight(num,1))])
%             weight=[num2str(links(num,:)) ' ---  ' num2str(linkweight(num,:)) ];
            num=num+1;
        end
    end
    
end

title('network')
axis([-r-2,r+2,-r-2,r+2])
% saveas(gcf,'network','jpg')
end