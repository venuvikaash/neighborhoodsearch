function d = CalculateDistance (array,x1,x2)

if x2 ~= 0
    if x1 == 0
        d = sqrt(((50-array(x2,1))^2) + ((50-array(x2,2))^2));
    else
        d = sqrt(((array(x1,1)-array(x2,1))^2) + ((array(x1,2)-array(x2,2))^2));
    end
else
    d =0;
end
