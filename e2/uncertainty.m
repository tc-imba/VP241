function uncertainty( x,y,dxi,dx,dyi,dy,c )
    for i=1:length(x)
        if(length(dx)>1)
            xx=x(i)*dxi+dx(i);
        else
            xx=x(i)*dxi+dx;
        end
        if(length(dy)>1)
            yy=y(i)*dyi+dy(i);
        else
            yy=y(i)*dyi+dy;
        end
        x1=x(i)-xx;
        y1=y(i)-yy;
        x2=x(i)+xx;
        y2=y(i)+yy;
        line([x1+0.3*xx x2-0.3*xx],[y1 y1],'color',c);
        line([x1+0.3*xx x2-0.3*xx],[y2 y2],'color',c);
        line([x1 x1],[y1+0.3*yy y2-0.3*yy],'color',c);
        line([x2 x2],[y1+0.3*yy y2-0.3*yy],'color',c);
        line([x(i) x(i)],[y1 y2],'color',c);
        line([x1 x2],[y(i) y(i)],'color',c);
    end
end

