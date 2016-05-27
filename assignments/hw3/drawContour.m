function drawContour(f)

    % Define the range of the contour plot
    x = 0:0.01:4;
    y = 0:0.01:4;
    
    % Evaluate objective values on the grid
    Z = zeros(length(x));
    for i = 1:length(x)
        for j = 1:length(y)
            Z(j,i) = feval(f,[x(i);y(j)]);
        end
    end
    
    % Plot contour
    contour3(x, y, Z, 100); 
    shading flat;