syms x;
      format long g;
        x0=1; %initial point
        f=x^3-2*x-2;
        ezplot(f); %plot to estimate
        delta=1e-8;%acc
        Maxint=50;
        fx=diff(f,x);%diff by symbol
        x1=x0;
        count=1;
        while count<=Maxint
        x2=x1-subs(f/fx,x1);
        if abs(x1-x2)<delta
        break;
        end
        x1=x2;
        count=count+1;
        end
        output=subs(f,x2);
        root=vpa(x2,10)%convert sym to float

