--====================================
--Desert Forest and Marsh by SailorCat
--
--Due to complications with the map 
--system, this does not affect Rain-
--forest. Fine. I don't care for
--it anyway.
--====================================

-----Allows for all non-water, non-ice features on Desert Hills
INSERT INTO Feature_ValidTerrains (FeatureType, TerrainType)
SELECT DISTINCT	FeatureType, 'TERRAIN_DESERT'
FROM Feature_ValidTerrains
WHERE FeatureType NOT IN (SELECT FeatureType FROM Features WHERE Coast = 1)
AND FeatureType NOT IN (SELECT FeatureType FROM Features WHERE Lake = 1)
AND FeatureType NOT IN (SELECT FeatureType FROM Features WHERE NaturalWonder = 1)
AND FeatureType NOT IN (SELECT FeatureType FROM Feature_ValidTerrains WHERE TerrainType = 'TERRAIN_COAST')
AND FeatureType NOT IN (SELECT FeatureType FROM Feature_ValidTerrains WHERE TerrainType = 'TERRAIN_OCEAN')
AND FeatureType NOT IN (SELECT FeatureType FROM Feature_ValidTerrains WHERE TerrainType = 'TERRAIN_DESERT')
AND FeatureType != 'FEATURE_ICE';
-----

-----Allows for all hills, non-water, non-ice features on Desert Hills
INSERT INTO Feature_ValidTerrains (FeatureType, TerrainType)
SELECT DISTINCT	FeatureType, 'TERRAIN_DESERT_HILLS'
FROM Feature_ValidTerrains
WHERE FeatureType IN (SELECT FeatureType FROM Feature_ValidTerrains WHERE TerrainType LIKE 'TERRAIN_%_HILLS')
AND FeatureType NOT IN (SELECT FeatureType FROM Features WHERE NaturalWonder = 1)
AND FeatureType NOT IN (SELECT FeatureType FROM Feature_ValidTerrains WHERE TerrainType = 'TERRAIN_DESERT_HILLS');
-----