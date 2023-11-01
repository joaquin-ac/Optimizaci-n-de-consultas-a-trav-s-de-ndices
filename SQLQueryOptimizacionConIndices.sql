--DBCC FREEPROCCACHE		--limpia Cache
--DBCC DROPCLEANBUFFERS		--limpia Buffer

--TABLA CON MILLON DE REGISTROS DE GASTO
/* 
Create table gasto	(
							idgasto int identity,
							idprovincia int,
							idlocalidad int,
							idconsorcio int, 
							periodo int,
							fechapago datetime,					     
							idtipogasto int,
							importe decimal (8,2),	
							Constraint FK_gasto_consorcio FOREIGN KEY (idprovincia,idlocalidad,idconsorcio) REFERENCES consorcio(idprovincia,idlocalidad,idconsorcio),
							Constraint FK_gasto_tipo FOREIGN KEY (idtipogasto) REFERENCES tipogasto(idtipogasto)					     					     						 					     					     
							)
*/
--TABLA CON MILLON DE REGISTROS DE GASTO


-- INICIO BUCLE
/*
DECLARE @id INT;
DECLARE @maxID INT;

-- Inicializar variables
SET @id = 1;
SELECT @maxID = 125;

-- Iniciar el bucle WHILE
WHILE @id <= @maxID
BEGIN

    insert into gasto
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
*/
-- FINAL BUCLE


--ELIMINAR RESTRICCION DE CLAVE PRIMARIA PARA CREAR IX_ClusteredIndex
alter table gasto
drop Constraint PK_gasto
--ELIMINAR RESTRICCION DE CLAVE PRIMARIA PARA CREAR IX_ClusteredIndex




-- Heap
--select periodo from gasto where periodo in (10,7,3)					-- Busqueda Heap



-- Índice Clustered
--select * from gasto where idgasto in (999,800,7087)					-- Busqueda sin indice Clustered

CREATE CLUSTERED INDEX IX_ClusteredIndex ON gasto(idgasto)				-- Crear indice clustered

--select * from gasto where idgasto in (999,800,7087)					-- Busqueda con indice Clustered 

--drop index IX_ClusteredIndex ON gasto									-- Eliminar indice



-- Índice Non-Clustered
--select periodo from gasto where periodo in (10,7,3)					-- Busqueda sin indice Non-Clustered 

CREATE NONCLUSTERED INDEX IX_NonClusteredIndex ON gasto(periodo)		-- Crear indice Non-Clustered

--select periodo from gasto where periodo in (10,7,3)					-- Busqueda con indice Non-Clustered 

--drop index IX_NonClusteredIndex ON gasto								-- Eliminar indice



-- Índice Unique
--select * from gasto where idgasto in (10,7,3)							-- Busqueda sin indice Unique

CREATE UNIQUE INDEX IX_UniqueIndex ON gasto(idgasto)					-- Crear indice Unique

--select * from gasto where idgasto in (10,7,3)							-- Busqueda con indice Unique

--drop index IX_UniqueIndex ON gasto									-- Eliminar indice



-- Índice con columnas incluidas 
--select fechapago, idtipogasto from gasto where periodo in (10,7,3)	-- Busqueda sin Índice con columnas incluidas 

CREATE NONCLUSTERED INDEX IX_IndexColIncluidas ON gasto(periodo)
INCLUDE (fechapago, idtipogasto);										-- Crear Índice con columnas incluidas

--select fechapago, idtipogasto from gasto where periodo in (10,7,3)	-- Busqueda con Índice con columnas incluidas 

--drop index IX_IndexColIncluidas ON gasto								-- Eliminar indice



-- Índice Filtrado
--select * from gasto where importe = 79395.75							-- Busqueda sin Índice Filtrado 

CREATE NONCLUSTERED INDEX IX_FilteredIndex ON gasto(importe)			
WHERE importe > 50000;													-- Crear Índice Filtrado

--select * from gasto where importe = 79395.75							-- Busqueda con Índice Filtrado

--drop index IX_FilteredIndex ON gasto									-- Eliminar indice