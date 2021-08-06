function  S = create_random_node (S)

%Field Dimensions - x and y maximum (in meters)
xm = 100;
ym = 100;

% Generate Random Nodes
S.xy = zeros(S.size,3);
for i=1:S.size
    S.xy(i,1) = rand(1,1)*xm;                     %x val
    S.xy(i,2) = rand(1,1)*ym;                     %y val
    S.xy(i,3) = CalculateDistance(S.xy,0,i);   %distance
    
end

% Sort S by Distance
for i=1:S.size
    for j=i+1:S.size
        if (S.xy(i,3) > S.xy(j,3))
            for k=1:3
                [S.xy(i,k) S.xy(j,k)] = SwapNumbers(S.xy(i,k),S.xy(j,k));
            end
        end
    end
end

%S.cover = randi([30 40],1,100);

%% distance Between nodes
for i=1:S.size
    for j=1:S.size
        S.distance(i,j) = CalculateDistance(S.xy,i,j); %distance
    end
end

end

