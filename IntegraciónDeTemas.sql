----------------------------------------------------------------------------------
-- INTEGRACION Optimizacion de consultas - Vistas indexadas - Tipo de datos JSON
----------------------------------------------------------------------------------

-- Agregar una columna JSON
ALTER TABLE gastoMillon
ADD datos_json NVARCHAR(MAX)

-- Actualizar los datos a formato JSON
UPDATE gastoMillon
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
		FROM [dbo].[gastoMillon]
		WHERE idgasto IN (999, 800, 7087)
)
GO

-- Creación de indice
CREATE  CLUSTERED INDEX IX_VistaGastoConJSON ON VistaGastoConJSON(idgasto);
GO

-- Consulta utilizando datos JSON
SELECT * FROM VistaGastoConJSON;