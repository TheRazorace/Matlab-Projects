clc;
clear all;

[x,c] = ReadGlass(214);
[Rc,Ru,Rep] = ClassMinDistEuclOne(x,c);

orio1=1;
orio2=70;
 for katigoria=1:7
  mikro=2000;
 for i=orio1:orio2
     summary=0;
   
     for j=orio1:orio2
         
      for deiktis=1:9
          summary=summary+(x(deiktis,i)-x(deiktis,j)).^2;
      end
 
     end
         if mikro > summary 
          mikro=summary;
          pr=i;
     end
 end
         
 
 elaxisto(katigoria)=mikro;
 protupo(katigoria)=pr;
 if katigoria~=7
     orio1=orio1+Rep(katigoria);
     orio2=orio2+Rep(katigoria+1);
 end
 
 end
 
 
 elaxisto(4)=0;

 Rc4 = zeros(7,1) ;   
protupo


