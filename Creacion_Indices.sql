
-- Eliminar clave primaria
alter table gastoMillon
drop Constraint PK_gastoMillon


-- Creacion de indices

-- �ndice Clustered
CREATE CLUSTERED INDEX IX_ClusteredIndex ON gastoMillon(idgasto)			-- Crear indice clustered

-- �ndice Non-Clustered
CREATE NONCLUSTERED INDEX IX_NonClusteredIndex ON gastoMillon(periodo)		-- Crear indice Non-Clustered

-- �ndice Unique
CREATE UNIQUE INDEX IX_UniqueIndex ON gastoMillon(idgasto)					-- Crear indice Unique

-- �ndice con columnas incluidas 
CREATE NONCLUSTERED INDEX IX_IndexColIncluidas ON gastoMillon(periodo)
INCLUDE (fechapago, idtipogasto);											-- Crear �ndice con columnas incluidas

-- �ndice Filtrado
CREATE NONCLUSTERED INDEX IX_FilteredIndex ON gastoMillon(importe)			
WHERE importe > 50000;														-- Crear �ndice Filtrado
