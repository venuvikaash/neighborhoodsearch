function S = calculate_drone_weight (S)

%% Calculate drone Weight
S.weight(1,1:S.size) = 1:S.size;
S.weight(2,1:S.size) = S.E;
loop = 1;

for i=1:S.size
    S.weight(2,i) = (S.weight(2,i)*(1-S.dead(i))+(S.power-(S.priority(i)/loop)));
end

end

