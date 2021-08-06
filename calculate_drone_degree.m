function S = calculate_drone_degree (S)

for i=1:S.size
    cnt = 1;
    t = 0;
    
    for j=1:S.size
        if (i ~= j) && (S.dead(i) == 0) && (S.distance(i,j) < 30)
            cnt = cnt+1;
            t = t+S.distance(i,j);
        end
    end
    
    if cnt ~= 1
        S.degree(i) =1-((t/(cnt-2))/30);
    else
        S.degree(i) = 0;
    end
end
