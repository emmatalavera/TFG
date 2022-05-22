%% Preparacion del dispositivo y datos

% IMPORTANTE: si se queda el objeto m abierto, genera problemas, siendo necesario eliminarlo en 
% la línea de comandos haciendo: clear global (objeto m)

%% Borrado de objetos previo
clear global;

% Variable que comprueba si se detecta un dispositivo móvil
a = 1;

%% Crear objeto 
try
    mCreation(mobiledev);
catch
    a = 0;
end

%% Cargar el fichero RedLSTM si no existe la variable "net". La variable está almacenada en RedLSTM
if not(exist('net','var'))
    load RedLSTM;
end