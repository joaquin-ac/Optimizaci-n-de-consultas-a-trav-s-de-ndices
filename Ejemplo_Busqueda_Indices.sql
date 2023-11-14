
-- Busqueda por indices
-- Heap
select periodo from gastoMillon where periodo in (10,7,3)					-- Busqueda Heap

-- Índice Clustered
select * from gastoMillon where idgasto in (999,800,8087)					-- Busqueda sin indice Clustered

-- Índice Non-Clustered
select periodo from gastoMillon where periodo in (10,7,3)					-- Busqueda sin indice Non-Clustered 

-- Índice Unique
select * from gastoMillon where idgasto in (10,7,3)							-- Busqueda sin indice Unique

-- Índice con columnas incluidas 
select fechapago, idtipogasto from gastoMillon where periodo in (10,7,3)	-- Busqueda sin Índice con columnas incluidas 

-- Índice Filtrado
select * from gastoMillon where importe = 79395.75							-- Busqueda sin Índice Filtrado 