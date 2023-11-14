
-- Eliminar clave primaria
alter table gastoMillon
drop Constraint PK_gastoMillon


-- Creacion de indices

-- Índice Clustered
CREATE CLUSTERED INDEX IX_ClusteredIndex ON gastoMillon(idgasto)			-- Crear indice clustered

-- Índice Non-Clustered
CREATE NONCLUSTERED INDEX IX_NonClusteredIndex ON gastoMillon(periodo)		-- Crear indice Non-Clustered

-- Índice Unique
CREATE UNIQUE INDEX IX_UniqueIndex ON gastoMillon(idgasto)					-- Crear indice Unique

-- Índice con columnas incluidas 
CREATE NONCLUSTERED INDEX IX_IndexColIncluidas ON gastoMillon(periodo)
INCLUDE (fechapago, idtipogasto);											-- Crear Índice con columnas incluidas

-- Índice Filtrado
CREATE NONCLUSTERED INDEX IX_FilteredIndex ON gastoMillon(importe)			
WHERE importe > 50000;														-- Crear Índice Filtrado
