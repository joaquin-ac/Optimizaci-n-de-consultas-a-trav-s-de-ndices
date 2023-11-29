----------------------------------------------------------------------------------
-- INTEGRACION Optimizacion de consultas - Vistas indexadas - Tipo de datos JSON
----------------------------------------------------------------------------------


-- Creación de indice
CREATE CLUSTERED INDEX IX_ClusteredIndex ON gastoMillon(idgasto)


-- Agregar una columna JSON
ALTER TABLE gastoMillon
ADD datos_json NVARCHAR(MAX)


-- Creación de la vista indexada con JSON
CREATE VIEW VistaGastoConJSON AS
(
	SELECT 
			idgasto, 
			idprovincia, 
			idlocalidad, 
			idconsorcio, 
			periodo, 
			fechapago, 
			importe,
			datos_json
		FROM gastoMillon
		WHERE idgasto IN (999, 800, 7087)
)
GO


-- Actualizar los datos a formato JSON
UPDATE VistaGastoConJSON
SET datos_json = (
	SELECT 
			idgasto, 
			idprovincia, 
			idlocalidad, 
			idconsorcio, 
			periodo, 
			fechapago, 
			importe
	FROM gastoMillon
	WHERE idgasto IN (999, 800, 7087)

	FOR JSON AUTO
);


-- Consulta utilizando datos JSON
SELECT * FROM VistaGastoConJSON;