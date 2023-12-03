function yp = derivadas(t,y,R,L,C,x)

yp = [y(2); -R/L*y(2)-1/(L*C)*y(1)+1/(L*C)*x ];