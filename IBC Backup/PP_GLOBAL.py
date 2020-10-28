# URL to the Cloud Data Pool where the tables to unify are hosted.
url = 'https://endresshauser.eu-3.celonis.cloud/'

# Specify a valid API token for your Cloud Team.
#Click on Team Settings -> Edit -> create or copy already inserted API key

api_token = 'N2JmNDI0NjMtNWQ3ZS00OGUzLTk3OTctYmJjMGM4OGE4Yjk2OnVtL3I0UldzVllJeTIwZFFIZ043R2FrTVUxRDEySFE5YWRHWnJtU2p6SkJL'


#To get the data pool id, you have to run the following code. To get the data
#the ML User here called Global needs permission to request these informations
#celonis = get_celonis()
#celonis.pools by that you get the ID for the data pool 

# Specify a datapool -- PP Data Pool ID
datapool = '590652c7-87a4-46e6-a9e9-60c90cb7c4e3'

# Specify the table names for which the tables should be merged. 

#CEPECT is empty in all systems

tables = [
'AFKO','AFPO','AFRU',
'AUFK','AUFM','CDHDR','CDPOS','CRHD','CRTX','DD02T','DD03M','JCDS','JSTO','LTAK','LTAP','MAKT','MARA','MARC','MBEW','T001','T001K','T001W','T003O','T003P','T003T','T023T','T156T','T399X','TCO43','TCORU','TCURC','TCURF','TCURR','TCURX','TCX00','TGSBT','TJ02T','TJ30T','USR02', 
         ]


# Specify 'min' if the unified table should be the minimal column requirement and 'null' if the not existing columns should be filled with null values.
function = 'null'

# Specify the required table schemas in a python list
#To acess the Schema Name you have to get the connection informations
#pool.data_connections
tableSchema = [
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_fff504b3-61e6-431a-9589-a0c8a1ccd3c6', # SAP ECC - PIN-020
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_bd6565ee-257a-4349-b3a2-ad0dfa097db7', # SAP ECC - PIN-024
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_9ea3d196-29ab-45e3-b825-4f6b80c543d2', # SAP ECC - PP1-011
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_f9111368-fa6e-436c-b891-ad340f7d20d8', # SAP ECC - PP2-004
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_897d99cb-b81d-4da1-b3da-d6c986f854bf', # SAP ECC - PP2-005
'590652c7-87a4-46e6-a9e9-60c90cb7c4e3_c0f88c52-814a-4a37-b3f7-6f03f593186a'  # SAP ECC - PS1-033
]

unify_tables(url = url, api_token = api_token, datapool = datapool, tables = tables, tableSchema = tableSchema, function = function)