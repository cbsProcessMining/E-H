# URL to the Cloud Data Pool where the tables to unify are hosted.
url = 'https://endresshauser.eu-3.celonis.cloud/'

# Specify a valid API token for your Cloud Team.
#Click on Team Settings -> Edit -> create or copy already inserted API key

api_token = 'NDEzZDFkN2YtZjVmZC00MTE0LTg2ODAtNmZlZDM5YzU5YTEwOjBxR0xOSFhjdDQ4MFNDc0V1UDIwbldzNWd2VXFVeUZieCt5MjdzbUhySkRP'


#To get the data pool id, you have to run the following code. To get the data
#the ML User here called Global needs permission to request these informations
#celonis = get_celonis()
#celonis.pools by that you get the ID for the data pool 

# Specify a datapool -- O2C Data Pool ID
datapool = '60442433-3dbb-4ce6-8ed3-e9bb7238c614'

# Specify the table names for which the tables should be merged. 
#KONV is not celonis standard


tables =['BKPF','BSAD','CDHDR','CDPOS','DD02T','DD03M','DD07T','JCDS','KNA1','KNB1','KNKK','LIKP','LIPS','LTAK','LTAP','MAKT','MARC','MARD','MKPF','MSEG','NAST','T001','T001L','T001W','T014T','T023T','T024B','T052', 'T052T', 'T179T','T459A','T459K','T685T','TBSLT','TCURF','TCURR','TJ02','TJ02T','TVAGT','TVAK','TVAP','TVAPT','TVAUT','TVEP','TVEPT','TVFST','TVGRT','TVKBT','TVKMT','TVKOT','TVLST','TVRO','TVSTT','TVTWT','USR02','VBAK','VBAP','VBEP','VBFA','VBKD','VBRK','VBRP','VBUK','VBUP','VTTK','VTTP','VTTS','ZZVGP','TTZZ','TTZR','T077X','T683T','TVSBT'
        ]


# Specify 'min' if the unified table should be the minimal column requirement and 'null' if the not existing columns should be filled with null values.
function = 'null'


#Schema Information

#60442433-3dbb-4ce6-8ed3-e9bb7238c614_575c3915-e50d-48c0-a472-da19db3eee29 = PCA042
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_8ae9a322-9256-4298-bc90-2a6af6e6b36f = PIN020
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_195c34a6-cf16-431b-88f5-a608f44a7c14 = PIN024
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_3bbd20b8-81ce-4068-bc77-212ddfb300c5 = PP1011
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_e67ac4d6-dd7d-4653-a043-cdd83c9728b7 = PP2004
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_5bf5be9d-f13f-48fc-a5c2-0741f85727ae = PP2005
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_ff5eeb0b-b3ab-401f-8dc0-e701c4fdbd2a = PS1007
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_62c67a31-0987-4424-b967-64680da71015 = PS1030
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_d897dfda-15fb-4fa9-968f-90db8694e7cd = PS1032
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_acc25658-cfd5-4696-b4af-aa112af23fba = PS1033
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_9d804771-eac4-4fde-b23e-39710d5a8b58 = PS1035
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_80493315-33aa-43ce-a702-f970bab30f6f = PS1036
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_6567a63c-c54f-4edf-a594-a6100441211e  = PS1038
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_1cadd211-41b9-4632-a006-ffe0b103f034  = PS1039
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_6caea70a-87a4-41cc-bd4c-61c4829a6860 = PS1040
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_926ef30e-b9b4-4931-887b-a42794341bbf = PS1044
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_4d74b0c1-007e-4650-a312-46237a1d746c = PSG045
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_9b65d55f-cd2e-4aa7-89ad-af9fac513a95 = PSG048
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_d0b7b155-1fe2-4d29-89f2-5cfe11acdd05 = PSG049
#60442433-3dbb-4ce6-8ed3-e9bb7238c614_886a0dcb-393a-4184-abf7-fa6e53b6dc10 = PS1090



# Specify the required table schemas in a python list
#To acess the Schema Name you have to get the connection informations
#pool.data_connections
tableSchema = [
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_3bbd20b8-81ce-4068-bc77-212ddfb300c5',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_9d804771-eac4-4fde-b23e-39710d5a8b58',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_195c34a6-cf16-431b-88f5-a608f44a7c14',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_acc25658-cfd5-4696-b4af-aa112af23fba',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_ff5eeb0b-b3ab-401f-8dc0-e701c4fdbd2a',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_8ae9a322-9256-4298-bc90-2a6af6e6b36f',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_6567a63c-c54f-4edf-a594-a6100441211e',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_9b65d55f-cd2e-4aa7-89ad-af9fac513a95',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_5bf5be9d-f13f-48fc-a5c2-0741f85727ae',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_d0b7b155-1fe2-4d29-89f2-5cfe11acdd05',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_e67ac4d6-dd7d-4653-a043-cdd83c9728b7',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_6caea70a-87a4-41cc-bd4c-61c4829a6860',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_d897dfda-15fb-4fa9-968f-90db8694e7cd',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_926ef30e-b9b4-4931-887b-a42794341bbf',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_62c67a31-0987-4424-b967-64680da71015',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_4d74b0c1-007e-4650-a312-46237a1d746c',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_575c3915-e50d-48c0-a472-da19db3eee29',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_1cadd211-41b9-4632-a006-ffe0b103f034',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_80493315-33aa-43ce-a702-f970bab30f6f',
'60442433-3dbb-4ce6-8ed3-e9bb7238c614_886a0dcb-393a-4184-abf7-fa6e53b6dc10' 
]

unify_tables(url = url, api_token = api_token, datapool = datapool, tables = tables, tableSchema = tableSchema, function = function)