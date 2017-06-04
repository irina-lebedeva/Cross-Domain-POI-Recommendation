function [Srec51 Srec101 Srec201 Spr51 Spr101 Spr201] = Recall(ira)
kol=0;
for i=1:19000
    
    if ira(i,2)~=111111
        k=1;
        recomm=0;
        net=0;
        user=ira(i,2);
         if ira(i,1)>=4.6
               pr=1;
         end
         if ira(i,1)<4.6
               pr=1;
         end
        ira(i,2)=111111;
        
            for j=1:19000
                if  ira(j,2)~=111111  
                if user==ira(j,2)
                      k=k+1;
                          if ira(j,1)>=4.6
                          recomm=recomm+1;
                          end
                            if ira(j,1)<4.6
                            net=net+1;
                          end
                      ira(j,2)=111111;    
                    end
                end   
            end
            
           kol=kol+1;  
            
       if recomm>=5       
       pr5(kol)=1;
       end  
       if recomm<5       
       pr5(kol)=recomm/5;
       end
        if recomm>=10       
       pr10(kol)=1;
       end  
       if recomm<10       
       pr10(kol)=recomm/10;
       end
       if recomm>=20
       pr20(kol)=1;
       end  
       if recomm<20       
       pr20(kol)=recomm/20;
       end
       
       
      if recomm>=5 
       rec5(kol)=5/k;
      end
       if recomm<5 
       rec5(kol)=recomm/k;
       end    
     
       if recomm>=10 
       rec10(kol)=10/k;
      end
       if recomm<10 
       rec10(kol)=recomm/k;
       end   
       
       if recomm>=20 
       rec20(kol)=20/k;
      end
       if recomm<20 
       rec20(kol)=recomm/k;
       end   
       
       
      
      
          
       ira2(kol,1)=user;
       ira2(kol,2)=k;
       ira2(kol,3)=recomm;
       ira2(kol,4)=pr5(kol);
       ira2(kol,5)=rec5(kol);
       
            
    end
end
    Srec5=0;
    Spr5=0;
    Srec10=0;
    Spr10=0;
    Srec20=0;
    Spr20=0;
       for i=1:kol
          
           Srec5=Srec5+rec5(i);
            Spr5=Spr5+pr5(i);
               Srec10=Srec10+rec10(i);
            Spr10=Spr10+pr10(i);
               Srec20=Srec20+rec20(i);
            Spr20=Spr20+pr20(i);
    
            end
            
    
    Srec5=Srec5/kol;
      Spr5=Spr5/kol;   
     Srec10=Srec10/kol;
      Spr10=Spr10/kol;  
        Srec20=Srec20/kol;
      Spr20=Spr20/kol; 
          
    Srec51=Srec5/kol;
      Spr51=Spr5/kol;   
     Srec101=Srec10/kol;
      Spr101=Spr10/kol;  
        Srec201=Srec20/kol;
      Spr201=Spr20/kol; 
      
      %disp(Srec5);
     %disp(Srec10); disp(Srec20);
     %disp(Spr5);
     %disp(Spr10); disp(Spr20);
     fprintf(' %6.4f(Recall), %6.4f(Precision)\n',Srec5, Spr5);
     fprintf(' %6.4f(Recall), %6.4f(Precision)\n',Srec10, Spr10);
      fprintf(' %6.4f(Recall), %6.4f(Precision)\n',Srec20, Spr20);