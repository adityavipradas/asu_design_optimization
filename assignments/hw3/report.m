%%%%%%%%%%%%%% Generate Report  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% By Max Yi Ren and Emrah Bayrak %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function report(solution,f)
    figure; % Open an empty figure window
    hold on; % Hold on to the current figure
    
    % Draw a 2D contour plot for the objective function
    % You can edit drawing parameters within the file: drawContour.m
    drawContour(f);
    
    % Plot the search path
    x = solution.x;
    iter = size(x,2);
    plot(x(1,1),x(2,1),'.y','markerSize',20);
    str1 = [num2str(x(1,1)),',',num2str(x(2,1))];
    text(x(1,1),x(2,1),str1);
    for i = 2:iter
        % Draw lines. Type "help line" to see more drawing options.
        line([x(1,i-1),x(1,i)],[x(2,i-1),x(2,i)],'Color','y');
        plot(x(1,i),x(2,i),'.y','markerSize',20);
    end
    title('Contour plot');
    xlabel('x2');
    ylabel('x3');
    str2 = [num2str(x(1,i)),',',num2str(x(2,i))];
    text(x(1,i),x(2,i),str2);
    % Plot the convergence
    F = zeros(iter,1);
    for i = 1:iter
        F(i) = feval(f,x(:,i));
    end
    figure;
    plot(1:iter, log(F-F(end)+eps),'k','lineWidth',3);
    title('Convergence Plot');
    xlabel('Iteration');
    ylabel('Log Convergence');