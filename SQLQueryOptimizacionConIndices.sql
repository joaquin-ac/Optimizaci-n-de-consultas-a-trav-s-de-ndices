--DBCC FREEPROCCACHE		--limpia Cache
--DBCC DROPCLEANBUFFERS		--limpia Buffer
-- Version: Microsoft SQL Server 2019 (RTM) - 15.0.2000.5 (X64) Express Edition (64-bit) 
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
/*
		TAREA: Insertar un millon de registros
		SELECT * FROM [dbo].[gastoMillon];
*/


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
