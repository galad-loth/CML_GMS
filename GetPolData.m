function T=GetPolData(data_op,R,C,A,B)
f=fopen(strcat(data_op,'T11.bin'),'r');
t11=fread(f,'float');
t11=reshape(t11,C,R);
g=fclose(f);
f=fopen(strcat(data_op,'T12_imag.bin'),'r');
t12_i=fread(f,'float');
t12_i=reshape(t12_i,C,R);
g=fclose(f);
f=fopen(strcat(data_op,'T12_real.bin'),'r');
t12_r=fread(f,'float');
t12_r=reshape(t12_r,C,R);
g=fclose(f);
t12=t12_r+i*t12_i;
f=fopen(strcat(data_op,'T13_imag.bin'),'r');
t13_i=fread(f,'float');
t13_i=reshape(t13_i,C,R);
g=fclose(f);
f=fopen(strcat(data_op,'T13_real.bin'),'r');
t13_r=fread(f,'float');
t13_r=reshape(t13_r,C,R);
g=fclose(f);
t13=t13_r+i*t13_i;
f=fopen(strcat(data_op,'T22.bin'),'r');
t22=fread(f,'float');
t22=reshape(t22,C,R);
g=fclose(f);
f=fopen(strcat(data_op,'T33.bin'),'r');
t33=fread(f,'float');
t33=reshape(t33,C,R);
g=fclose(f);
f=fopen(strcat(data_op,'T23_imag.bin'),'r');
t23_i=fread(f,'float');
t23_i=reshape(t23_i,C,R);
g=fclose(f);
f=fopen(strcat(data_op,'T23_real.bin'),'r');
t23_r=fread(f,'float');
t23_r=reshape(t23_r,C,R);
g=fclose(f);
t23=t23_r+i*t23_i;
t11=flipud(t11);t11=rot90(t11,3);t12=flipud(t12);t12=rot90(t12,3);t13=flipud(t13);t13=rot90(t13,3);
t22=flipud(t22);t22=rot90(t22,3);t23=flipud(t23);t23=rot90(t23,3);t33=flipud(t33);t33=rot90(t33,3);
t11=t11(A,B);t12=t12(A,B);t13=t13(A,B);t22=t22(A,B);t23=t23(A,B);t33=t33(A,B);
TCol=length(A)*length(B);
t11=reshape(t11,1,TCol);t12=reshape(t12,1,TCol);t13=reshape(t13,1,TCol);
t22=reshape(t22,1,TCol);t23=reshape(t23,1,TCol);t33=reshape(t33,1,TCol);
t21=conj(t12);
t31=conj(t13);
t32=conj(t23);
T=[t11;t21;t31;t12;t22;t32;t13;t23;t33];


       

