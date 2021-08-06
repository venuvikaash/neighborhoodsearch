function plot_random_drone(S, name, show_no)

scrsz = get(0,'ScreenSize');

if length(name) <= 1
    figure(name);
    clf
else
figure('name',name,'Position',[1 scrsz(2) scrsz(3) scrsz(4)]);
end

for i=1:S.size
    if (S.dead(i) == 0)

        plot(S.xy(i,1),S.xy(i,2),'b.','Markersize',30);
       
           %line([50 50],[S.xy(i,1) S.xy(i,2)]...,
               %,'color','b','LineStyle','-');
       %  line([S.xy(50,1) S.xy(i,1)],[S.xy(50,1) S.xy(i,2)]],'color','b','LineStyle','-');
        % line([S.xy(i,1) S.xy(50,1)],'color','b','LineStyle','-');
    else
      %  figure (1)
        plot(S.xy(i,1),S.xy(i,2),'k.','Markersize',30);
    end
    
    if show_no == 1
        text(S.xy(i,1)+1,S.xy(i,2)+1,num2str(i));
    end
    hold on;
end
 %hold off;
%plot(S.xy(50,1),S.xy(50,2),'sr');
%text(S.xy(50,1)+1,S.xy(50,2)-2,'base')
%plot(50,50,'sr');
%text(51,51,'Base');
%for i=1:50
    %line([50 50],[S.xy(i,1) S.xy(i,2)],'color','b','LineStyle','-');
   % end
axis equal;
axis([0 100 0 100]);

xlabel('Area (m)')
ylabel('Area (m)')

end

