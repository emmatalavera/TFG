readAPIKey = evalin('base','readAPIKey');

% Se obtienen los datos desde enero de 2022 hasta la fecha actual --> historial
% de acciones
data = thingSpeakRead(channelID, 'ReadKey', readAPIKey,'Fields',[4], OutputFormat='table', ...
    DateRange=[datetime(2022, 01, 01), datetime('now')]);

% Se ordenan de mayor a menor fecha
if size(data) >=1
    [datosOrdenados,index] = sortrows(data,"Timestamps",'descend'); 
end