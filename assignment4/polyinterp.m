
function y0=polyinterp(x,y,x0)
k=0;                        % initialize counter k
while(k<length(x) && length(x)==length(y))                      
  k=k+1;                         % k counts clicks
    % add new point to the list
  c=newtdd(x,y,k);% get interpolation coeffs
  x1=-1:.01:4;
  y1=nest(k-1,c,x1,x);  % get y coordinates of curve
  y0=nest(k-1,c,x0,x);
  plot(x,y,'bo',x1,y1,x0,y0,'r--o')
end