
function thingspeak(aceleracion, clasificacion)

    channelID = evalin('base','channelID');
    readAPIKey = evalin('base','readAPIKey');
    writeAPIKey = '3WYDBASFVPS77ULD';

    aceleracionX = aceleracion(1);
    aceleracionY = aceleracion(2);
    aceleracionZ = aceleracion(3);

    if clasificacion == "Sentado"

        data = thingSpeakRead(channelID, 'ReadKey', readAPIKey, OutputFormat='table', ...
            DateRange=[datetime(2022, 01, 01), datetime('now')]);
        
        dataSize = size(data);
        
        if dataSize  ~= 0
            %dataSize(1) --> número de filas
            ultimoElemento = data(dataSize(1), "classification");

              if  strcmp(ultimoElemento.classification, clasificacion) |  strcmp(ultimoElemento.classification, 'Sin movimiento')
                 clasificacion = 'Sin movimiento';
              end 
        end
    end

    % Escribir los datos de aceleración y clasificación en el canal 
    thingSpeakWrite(channelID, {aceleracionX,aceleracionY,aceleracionZ, clasificacion}, 'WriteKey', writeAPIKey);
    pause(5); % solo 5 porque obtener la actividad son 10
end