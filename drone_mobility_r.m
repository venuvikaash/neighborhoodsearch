function S = drone_mobility_r ( S )

S = calculate_drone_degree (S);
S = calculate_drone_weight (S);
S.tx=0;
plot_random_drone_s (S,'sink',1);
plot_random_drone_s (S,'sink',1);
dead=0;
for ro=1:S.ro
    ro
    S.live(ro) = S.size-dead;
    if dead == S.size
        break;
    end
    
    for j=1:S.size
        figure (2)
        plot((S.xy(j,1)-1),(S.xy(j,2)-1),'r.','MarkerSize',20);
        for i=1:S.size
            if (S.dead(i)==0)
                if S.E(i) < 0.0001
                    dead = dead+1;
                    S.dead(i) = 1;
                end
                
                if (S.dead(i)==0)
                   
                    if ((CalculateDistance(S.xy,j,i))<=30)
                        d=S.distance(j,i);
                        figure (2)
                        plot(S.xy(i,1),S.xy(i,2),'y.','MarkerSize',30);
                        pause (0.01)
                        figure (2)
                        plot(S.xy(i,1),S.xy(i,2),'b.','MarkerSize',30);
                       
                         S.Eout(i) = S.Eout(i) + (S.Etx*(S.packets(i)) + S.Efs*(S.packets(i))*(power(d,4)));
            S.E(i) = S.E(i) - (S.Etx*(S.packets(i)) + S.Efs*(S.packets(i))*(power(d,4)));
                        S.tx = S.tx +1;
                        S.Eco=S.Eout(i);
                    else
                                     S.packets(i)=S.packets(i)+2000;
                    end
                else
                    figure (2)
                    plot(S.xy(i,1),S.xy(i,2),'k.','MarkerSize',30);
                end
            end
        end
        plot((S.xy(j,1)-1),(S.xy(j,2)-1),'w.','MarkerSize',20);
    end
   S.Eco=S.Eco; 
end
end

