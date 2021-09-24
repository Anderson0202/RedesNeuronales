clear a;
a=arduino()
leer='D4';
escribir='D2';

entrada1=[];
entrada2=[];
target=[];

net=newp([-2 2; -2 2],1);
net.trainParam.epochs=5;

muestras=input('Ingresa número de muestras y presiona enter: ');%Definimos la cantidad de muestras con las que se va a alimentar la base de conocimiento

fprintf('Ingresa los datos correspondientes a la primera entrada:   ')

for fila1=1:muestras    
    bit=readDigitalPin(a,leer)
    entrada1(fila1)=bit;
     aux=input(' ');
end

fprintf('Ingresa los datos correspondientes a la segunda entrada:   ')

for fila1=1:muestras    %se llenan las muestras correspondientes al potenciometro 0 
    bit=readDigitalPin(a,leer)
    entrada2(fila1)=bit;
     aux=input(' ');
end

fprintf('Ingresa los datos correspondientes a la salida esperada o target:   ')

for fila1=1:muestras    %se llenan las muestras correspondientes al potenciometro 0  
    bit=readDigitalPin(a,leer)
    target(fila1)=bit;
    
     aux=input(' ');
end

entradas=[entrada1;entrada2];

net=train(net,entradas,target);

verificador=input('Quieres verificar alguna entrada? (1 para si, 0 para no):   ')

while verificador==1
    fprintf('Ingresa vector a verificar (formato [dato1; dato2]:  ')
    verificador=input(' ');
    led=sim(net,verificador)
    
    writeDigitalPin(a,escribir,led)
    verificador=input('Quieres verificar alguna entrada?:   ')
end
