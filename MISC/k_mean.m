K = 3 ;
data = uint8(rand(2,5000) * 255) ;
[C,A] = vl_ikmeans(data,K) ;

cl = get(gca,'ColorOrder') ;
ncl = size(cl,1) ;
hold on;
for k=1:K
  sel  = find(A  == k) ;
  plot(data(1,sel),  data(2,sel),  '.',...
       'Color',cl(mod(k,ncl)+1,:)) ;
end
