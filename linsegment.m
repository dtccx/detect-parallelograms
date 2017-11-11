I  = imread('test2canny.jpg');
[m,n]=size(I);
[H,theta, rho]=houghTs(I,1);
%imshow(theta,rho,H,[ ],'notruesize'),axis on, axis normal
xlabel('\theta'),ylabel('\rho')
[r,c]=hough_peaks(H,80);
hold on
plot(theta(c),rho(r),'s','color','white')
lines=hough_line(I,theta,rho,r,c);
figure,imshow(I),hold on

p_diff=20;
theta_diff=3;
len_diff=20;

%thin

for a=length(lines):-1:1
    flag=1;
    for b=a-1:-1:1
        if(abs(lines(a).rho-lines(b).rho)<=p_diff&&abs(lines(a).theta-lines(b).theta) ...
                <=theta_diff)%same line
            %lines(a).point2+=lines(a).point2;
            flag=0;% same
        end
    end
    if(flag==1)
        xy = [lines(a).point1; lines(a).point2];
        plot(xy(:,2),xy(:,1),'LineWidth',2,'Color','Red');
    end
end

%             plot(lines(k).point1[0,1],'r.','MarkerSize',20);
%             plot(lines(k).point2,'r.','MarkerSize',20);
%             text(,max_text);


% for a=1:length(lines)-1
%     for b=a+1:length(lines)
%         if(abs(lines(a).length-lines(b).length)<=len_diff&&abs(lines(a).theta-lines(b).theta) ...
%                 <=theta_diff&&abs(lines(a).rho-lines(b).rho)>=p_diff)
%             para=[lines(a).point1;lines(a).point2];
%             para2=[lines(b).point1;lines(b).point2];
%             fprintf('%d,%d\n',a,b);
%             plot(para(:,2),para(:,1),'LineWidth',2,'Color','Yellow');
%             plot(para2(:,2),para2(:,1),'LineWidth',2,'Color','Blue');
%         end
%     end
% end