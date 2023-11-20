
--DBCC FREEPROCCACHE		--limpia Cache
--DBCC DROPCLEANBUFFERS		--limpia Buffer

-- Creacion de indices

-- Índice Clustered
select * from gastoMillon where idgasto in (999,800,7087)						-- Busqueda sin indice Clustered

CREATE CLUSTERED INDEX IX_ClusteredIndex ON gastoMillon(idgasto)				-- Crear indice clustered

--select * from gastoMillon where idgasto in (999,800,7087)					-- Busqueda con indice Clustered 

--drop index IX_ClusteredIndex ON gastoMillon								-- Eliminar indice


-- Índice Non-Clustered
select periodo from gastoMillon where periodo in (10,7,3)						-- Busqueda sin indice Non-Clustered 

CREATE NONCLUSTERED INDEX IX_NonClusteredIndex ON gastoMillon(periodo)		-- Crear indice Non-Clustered

--select periodo from gastoMillon where periodo in (10,7,3)					-- Busqueda con indice Non-Clustered 

--drop index IX_NonClusteredIndex ON gastoMillon								-- Eliminar indice


-- Índice Unique
select * from gastoMillon where idgasto in (10,7,3)							-- Busqueda sin indice Unique

CREATE UNIQUE INDEX IX_UniqueIndex ON gastoMillon(idgasto)					-- Crear indice Unique

--select * from gastoMillon where idgasto in (10,7,3)							-- Busqueda con indice Unique

--drop index IX_UniqueIndex ON gastoMillon									-- Eliminar indice


-- Índice con columnas incluidas 
select fechapago, idtipogasto from gastoMillon where periodo in (10,7,3)		-- Busqueda sin Índice con columnas incluidas 

CREATE NONCLUSTERED INDEX IX_IndexColIncluidas ON gastoMillon(periodo)		-- Crear Índice con columnas incluidas
INCLUDE (fechapago, idtipogasto);										

--select fechapago, idtipogasto from gastoMillon where periodo in (10,7,3)	-- Busqueda con Índice con columnas incluidas 

--drop index IX_IndexColIncluidas ON gastoMillon								-- Eliminar indice


-- Índice Filtrado
select * from gastoMillon where importe = 79395.75							-- Busqueda sin Índice Filtrado 

CREATE NONCLUSTERED INDEX IX_FilteredIndex ON gastoMillon(importe)			-- Crear Índice Filtrado
WHERE importe > 50000;													

--select * fromgastoMillon where importe = 79395.75							-- Busqueda con Índice Filtrado

--drop index IX_FilteredIndex ON gastoMillon									-- Eliminar indice


/*
	TIEMPOS DE RESPUESTAS SEGÚN TIPO DE INDICES

Índices Agrupado o Clustered:
-costo/tiempo de búsqueda sin índice: 0.126 segundos
-costo/tiempo de creación de índice: 2.113 segundos
-costo/tiempo de búsqueda con índice: menos de 0.000 segundos


Índices No Agrupados o Non-Clustered
-costo/tiempo de búsqueda sin índice: 0.565 segundos
-costo/tiempo de creación de índice: 3.308 segundos
-costo/tiempo de búsqueda con índice: 0.431 segundos

Índices Únicos o Unique
-costo/tiempo de búsqueda sin índice: 0.149 segundos
-costo/tiempo de creación de índice: 1.283 segundos
-costo/tiempo de búsqueda con índice: menos de 0.000 segundos

Índices con Columnas Incluidas
-costo/tiempo de búsqueda sin índice: 0.403 segundos
-costo/tiempo de creación de índice: 3.626 segundos
-costo/tiempo de búsqueda con índice: 0.245 segundos

Índices Filtrados
-costo/tiempo de búsqueda sin índice: 0.149 segundos
-costo/tiempo de creación de índice: 0.81 segundos
-costo/tiempo de búsqueda con índice: 0.006 segundos

*/
