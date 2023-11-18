
--Creacion tabla de prueba
Create table gastoMillon(
							idgasto int identity,
							idprovincia int,
							idlocalidad int,
							idconsorcio int, 
							periodo int,
							fechapago datetime,					     
							idtipogasto int,
							importe decimal (8,2),	
							Constraint FK_gastoMillon_consorcio FOREIGN KEY (idprovincia,idlocalidad,idconsorcio) REFERENCES consorcio(idprovincia,idlocalidad,idconsorcio),
							Constraint FK_gastoMillon_tipo FOREIGN KEY (idtipogasto) REFERENCES tipogasto(idtipogasto)					     					     						 					     					     
                         )

--Carga lote de prueba
-- INICIO BUCLE
DECLARE @id INT;
DECLARE @maxID INT;

-- Inicializar variables
SET @id = 1;
SELECT @maxID = 125;

-- Iniciar el bucle WHILE
WHILE @id <= @maxID
BEGIN

    insert into gastoMillon
    select	idprovincia,
	idlocalidad,
	idconsorcio,
	periodo,
	fechapago,
	idtipogasto,
	importe from gasto

    -- Incrementar el ID para pasar al siguiente registro
    SET @id = @id + 1;
END;
-- FINAL BUCLE