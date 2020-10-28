# URL to the Cloud Data Pool where the tables to unify are hosted.
url = 'https://endresshauser.eu-3.celonis.cloud/'

# Specify a valid API token for your Cloud Team.
#Click on Team Settings -> Edit -> create or copy already inserted API key

api_token = 'MjIzOWU2YmMtYjZjOC00Mjc2LWJhMjktMTQ0ZjI5NWRiNmMyOndPQVBVc2NQVkI2QlVJRkwvZ3QzVTJNTkhoYmVoWWJkRFhmNkg5THMzYjd6'


#To get the data pool id, you have to run the following code. To get the data
#the ML User here called Global needs permission to request these informations
#celonis = get_celonis()
#celonis.pools by that you get the ID for the data pool 

# Specify a datapool -- WM Data Pool ID
datapool = '98d9fc62-ccbf-4158-b89f-cb8a7a976a2d'

# Specify the table names for which the tables should be merged. 

tables =    ['CDHDR','CDPOS', 'DD02T', 'DD03M', 'LTAK', 'LTAP', 'LTBK','LTBP','MKPF','MSEG',
             'QALS', 'QAVE', 'T163K', 'T300T', 'T301T', 'T302T', 'T308', 'T308T', 'T336T', 'USR02'
         ]


# Specify 'min' if the unified table should be the minimal column requirement and 'null' if the not existing columns should be filled with null values.
function = 'null'

#Schema Information

#<DataConnection, id 130521d8-53e7-49d0-abf1-ef3e8300cce4, name SAP ECC - PIN-020>,
#<DataConnection, id e453d486-da03-497c-8c1d-1f21f4ce6ee2, name SAP ECC - PIN-024>,
#<DataConnection, id bec2b69a-269f-4aad-b9d8-312bd4e8e9d3, name SAP ECC - PP1-011>,
#<DataConnection, id e54616c8-7ec1-43d1-8c35-d7fe7367b019, name SAP ECC - PP2-004>,
#<DataConnection, id ba105640-52a9-4d05-bbbb-cb5fb3543b01, name SAP ECC - PP2-005>,





# Specify the required table schemas in a python list
#To acess the Schema Name you have to get the connection informations
#pool.data_connections
tableSchema = [
'98d9fc62-ccbf-4158-b89f-cb8a7a976a2d_130521d8-53e7-49d0-abf1-ef3e8300cce4',
'98d9fc62-ccbf-4158-b89f-cb8a7a976a2d_e453d486-da03-497c-8c1d-1f21f4ce6ee2',
'98d9fc62-ccbf-4158-b89f-cb8a7a976a2d_bec2b69a-269f-4aad-b9d8-312bd4e8e9d3',
'98d9fc62-ccbf-4158-b89f-cb8a7a976a2d_e54616c8-7ec1-43d1-8c35-d7fe7367b019',
'98d9fc62-ccbf-4158-b89f-cb8a7a976a2d_ba105640-52a9-4d05-bbbb-cb5fb3543b01'

]

unify_tables(url = url, api_token = api_token, datapool = datapool, tables = tables, tableSchema = tableSchema, function = function)