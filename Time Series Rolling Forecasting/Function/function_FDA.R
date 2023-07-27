
retx<-function(x){            ##x: price vector, should be a numeric vector
  
  x[-1]/x[-length(x)]-1  
  
}

##log return
logrx<-function(x){           ##x: price vector, should be a numeric vector     
  
  diff(log(x))
   
}

retx<-function(x){            ##x: price vector, should be a numeric vector
  x[-1]/x[-length(x)]-1  
}

##log return
logrx<-function(x){           ##x: price vector, should be a numeric vector     
  
  diff(log(x))
  
}

my_skewness<-function(x){
    T<-length(x)
    y<-x-mean(x)
    T*sqrt(T-1)/(T-2)*sum(y^3)/(sum(y^2)^(3/2))
}

my_kurtosis<-function(x){
  T<-length(x)
  y<-x-mean(x)
  f1<-T*(T+1)*(T-1)/((T-2)*(T-3))
  f2<-3*((T-1)^2)/((T-2)*(T-3))
  f1*sum(y^4)/(sum(y^2)^2)-f2
}

my_acf1<-function(x){            
  acf(x, plot=F)[[1]][2] 
}            

VaR_normx<-function(x, amountx, alphax){       ##xx: return vector, amountx: money
  
  meanx<-mean(x, na.rm = T)
  sdx<-sd(x, na.rm = T)
  
  (meanx + sdx*qnorm(alphax))*amountx
  
}
VaR_samplex<-function(x, amountx, alphax){     ##xx: return vector, amountx: money
  
  qx<-as.numeric(quantile(x, alphax))
  
  qx*amountx
  
}
ES_samplex<-function(x, amountx, alphax){   ##xx: return vector, amountx: money
  
  qx<-as.numeric(quantile(x, alphax))
  indx<-x<=qx
  
  mean(x*indx)/alphax*amountx
  
}
LPSDx<-function(x, rfx){                ##x = asset's return, rfx = risk-free return
  
  erx<-x-rfx
  indx<-erx<0
  
  sqrt(sum((erx)^2*indx)/length(x))
  
}
parkinson_v<-function(h, l){              ##h: high price vector, l: low price vector
  
  x<-sum((log(h)-log(l))^2)
  x<-x/(4*length(h)*log(2))
  return(sqrt(x))
  
}
garman_klass_v<-function(op, h, l, cl){ ##h: high price vector, l: low price vector
  ##l: low price vector, cl: close price vector
  x<-mean((log(h)-log(l))^2)
  x1<-mean((log(cl)-log(op))^2)
  x2<-0.5*x-(2*log(2)-1)*x1
  return(sqrt(x2))
  
}
rsy_v<-function(op, h, l, cl){          ##h: high price vector, l: low price vector
  ##l: low price vector, cl: close price vector
  
  x<-mean((log(h)-log(cl))*(log(h)-log(op)))
  x1<-mean((log(l)-log(cl))*(log(l)-log(op)))
  x2<-x+x1
  return(sqrt(x2))
  
}
yz_v<-function(op, h, l, cl, alphax = 1.34){     ##this produces the same answer as 
  ##using the command volatility in package TTR
  ##alphax = theta in the slide
  kx<-(alphax-1)/(alphax+(length(op[-1])+1)/(length(op[-1])-1))
  
  sigma2_mox<-mean(log(op[-1])-log(cl[-length(cl)]))
  sigma2_ox<-log(op[-1])-log(cl[-length(cl)])-sigma2_mox
  sigma2_ox<-sum(sigma2_ox^2)/(length(op[-1])-1)
  
  sigma2_mcx<-mean(log(cl[-1])-log(op[-1]))
  sigma2_cx<-log(cl[-1])-log(op[-1])-sigma2_mcx
  sigma2_cx<-sum(sigma2_cx^2)/(length(cl[-1])-1)
  
  ##rsy vx 
  x<-mean((log(h[2:length(h)])-log(cl[2:length(cl)]))*(log(h[2:length(h)])-log(op[2:length(op)])))
  x1<-mean((log(l[2:length(l)])-log(cl[2:length(cl)]))*(log(l[2:length(l)])-log(op[2:length(op)])))
  x2<-x+x1
  
  return(sqrt(sigma2_ox+kx*sigma2_cx+(1-kx)*x2))
  
}
rvx<-function(x){                        ##x is a return vector
  
  x<-as.numeric(x)                                 
  
  return(sum(x^2, na.rm = T))
  
}
por_ret_N<-function(x){                              ##x: is a data frame or matrix of return data          
  
  return(apply(x, 1, mean, na.rm = T))
  
}
por_ret_bh<-function(x){                             ##x: is a data frame or matrix of return data            
  
  x<-rbind(0, x)                                   ##add initial period (return=0)
  x<-x+1
  bh_cumr<-apply(x, 2, cumprod)
  bh_cumr<-apply(bh_cumr, 1, mean, na.rm = T)
  return(bh_cumr[-1]/bh_cumr[-length(bh_cumr)]-1)
  
}
