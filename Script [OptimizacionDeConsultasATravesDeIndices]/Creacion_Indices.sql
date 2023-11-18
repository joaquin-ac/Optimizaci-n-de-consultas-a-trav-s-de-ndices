
--DBCC FREEPROCCACHE		--limpia Cache
--DBCC DROPCLEANBUFFERS		--limpia Buffer

-- Eliminar clave primaria
alter table gastoMillon
drop Constraint PK_gastoMillon


-- Creacion de indices

-- �ndice Clustered
select * from gasto where idgasto in (999,800,7087)						-- Busqueda sin indice Clustered

CREATE CLUSTERED INDEX IX_ClusteredIndex ON gasto(idgasto)				-- Crear indice clustered

--select * from gasto where idgasto in (999,800,7087)					-- Busqueda con indice Clustered 

--drop index IX_ClusteredIndex ON gasto									-- Eliminar indice


-- �ndice Non-Clustered
select periodo from gasto where periodo in (10,7,3)						-- Busqueda sin indice Non-Clustered 

CREATE NONCLUSTERED INDEX IX_NonClusteredIndex ON gasto(periodo)		-- Crear indice Non-Clustered

--select periodo from gasto where periodo in (10,7,3)					-- Busqueda con indice Non-Clustered 

--drop index IX_NonClusteredIndex ON gasto								-- Eliminar indice


-- �ndice Unique
select * from gasto where idgasto in (10,7,3)							-- Busqueda sin indice Unique

CREATE UNIQUE INDEX IX_UniqueIndex ON gasto(idgasto)					-- Crear indice Unique

--select * from gasto where idgasto in (10,7,3)							-- Busqueda con indice Unique

--drop index IX_UniqueIndex ON gasto									-- Eliminar indice


-- �ndice con columnas incluidas 
select fechapago, idtipogasto from gasto where periodo in (10,7,3)		-- Busqueda sin �ndice con columnas incluidas 

CREATE NONCLUSTERED INDEX IX_IndexColIncluidas ON gasto(periodo)		-- Crear �ndice con columnas incluidas
INCLUDE (fechapago, idtipogasto);										

--select fechapago, idtipogasto from gasto where periodo in (10,7,3)	-- Busqueda con �ndice con columnas incluidas 

--drop index IX_IndexColIncluidas ON gasto								-- Eliminar indice


-- �ndice Filtrado
select * from gasto where importe = 79395.75							-- Busqueda sin �ndice Filtrado 

CREATE NONCLUSTERED INDEX IX_FilteredIndex ON gasto(importe)			-- Crear �ndice Filtrado
WHERE importe > 50000;													

--select * from gasto where importe = 79395.75							-- Busqueda con �ndice Filtrado

--drop index IX_FilteredIndex ON gasto									-- Eliminar indice


/*
	TIEMPOS DE RESPUESTAS SEG�N TIPO DE INDICES

�ndices Agrupado o Clustered:
-costo/tiempo de b�squeda sin �ndice: 0.126 segundos
-costo/tiempo de creaci�n de �ndice: 2.113 segundos
-costo/tiempo de b�squeda con �ndice: menos de 0.000 segundos


�ndices No Agrupados o Non-Clustered
-costo/tiempo de b�squeda sin �ndice: 0.565 segundos
-costo/tiempo de creaci�n de �ndice: 3.308 segundos
-costo/tiempo de b�squeda con �ndice: 0.431 segundos

�ndices �nicos o Unique
-costo/tiempo de b�squeda sin �ndice: 0.149 segundos
-costo/tiempo de creaci�n de �ndice: 1.283 segundos
-costo/tiempo de b�squeda con �ndice: menos de 0.000 segundos

�ndices con Columnas Incluidas
-costo/tiempo de b�squeda sin �ndice: 0.403 segundos
-costo/tiempo de creaci�n de �ndice: 3.626 segundos
-costo/tiempo de b�squeda con �ndice: 0.245 segundos

�ndices Filtrados
-costo/tiempo de b�squeda sin �ndice: 0.149 segundos
-costo/tiempo de creaci�n de �ndice: 0.81 segundos
-costo/tiempo de b�squeda con �ndice: 0.006 segundos

*/
