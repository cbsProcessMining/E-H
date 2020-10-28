# URL to the Cloud Data Pool where the tables to unify are hosted.
url = 'https://endresshauser.eu-3.celonis.cloud/'

# Specify a valid API token for your Cloud Team.
#Click on Team Settings -> Edit -> create or copy already inserted API key

api_token = 'NDEzZDFkN2YtZjVmZC00MTE0LTg2ODAtNmZlZDM5YzU5YTEwOjBxR0xOSFhjdDQ4MFNDc0V1UDIwbldzNWd2VXFVeUZieCt5MjdzbUhySkRP'


#To get the data pool id, you have to run the following code. To get the data
#the ML User here called Global needs permission to request these informations
#celonis = get_celonis()
#celonis.pools by that you get the ID for the data pool 

# Specify a datapool -- P2P Data Pool ID
datapool = 'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27'

# Specify the table names for which the tables should be merged. 

tables = ['BKPF','BSEG','CDHDR','CDPOS','DD02T','DD03M','DD07T','EBAN','EINA','EKBE','EKES','EKET','EKKO','EKPO','LFA1','LFB1','LFM1','LIKP','LTAK','LTAP','MAKT','MARA','MARC','MKPF','MSEG','NAST','QALS','QAVE','QPAM','QPCD','QPGR','RBKP','RSEG','T001','T001L','T001W','T008T','T023T','T024','T024E','T161T','T163I','T163Y','T16FE','T179T','T685T','TCURF','TCURR','TCURV','TCURX','USR02','VBFA','ZZFAX01', 'T320','T134T','T307T','T077Y']


# Specify 'min' if the unified table should be the minimal column requirement and 'null' if the not existing columns should be filled with null values.
function = 'null'

#Schema Information

#<DataConnection, id 77f18ab5-b465-4e03-8f67-0272cd01ddfb, name SAP ECC - PIN-020>,
#<DataConnection, id 310d0ab5-5bb5-4d64-8a34-84bc93121d58, name SAP ECC - PIN-024>,
#<DataConnection, id 8adecd8c-3535-43d2-bb7c-af12f175e8f5, name SAP ECC - PS1-033>,
#<DataConnection, id a61e719d-5566-4328-b183-1d393f8879aa, name SAP ECC - PS1-035>,
#<DataConnection, id b6fbc486-9719-4d69-87dc-50a471c5f95f, name SAP ECC - PS1-036>,
#<DataConnection, id def198a6-426d-4ccb-b0ec-52dc2d1c519a, name SAP ECC - PS1-038>,
#<DataConnection, id 98f12823-2c82-4df3-a4e0-3f932fb27879, name SAP ECC - PS1-039>,
#<DataConnection, id d04e6dc0-5b53-420a-b624-8eed5d1b7db7, name SAP ECC - PS1-030>,
#<DataConnection, id 621b2b5e-1c46-4e81-b13b-15bc607ff983, name SAP ECC - PS1-007>,
#<DataConnection, id ffdff050-1fe4-43aa-ae9a-cd4763450e59, name SAP ECC - PS1-040>,
#<DataConnection, id 5a2082de-1aec-4bff-850c-7a923f2d094b, name SAP ECC - PS1-044>,
#<DataConnection, id 70f5784d-f0b6-4ce0-a368-6104c27a245b, name SAP ECC - PS1-032>,
#<DataConnection, id 7982c009-f641-4fa7-b74c-4c79febc733a, name SAP ECC - PSG-045>,
#<DataConnection, id 00409fbb-dad1-444e-90c1-c026cf6b9588, name SAP ECC - PSG-048>,
#<DataConnection, id 90db209c-f801-4c03-90d2-dac4c191ba9b, name SAP ECC - PSG-049>,
#<DataConnection, id 7a3bafc7-ae0a-4c96-82bf-0e16ba8ff97d, name SAP ECC - PCA-042>,
#<DataConnection, id 9363d8e4-bbd1-4454-ab9f-b115ab31aa5c, name SAP ECC - PP1-011>,
#<DataConnection, id 1c0a359a-f05b-4fa7-8cac-b0018a68ee74, name SAP ECC - PP2-004>,
#<DataConnection, id 920b7d87-7487-47b2-b46a-0727145161ce, name SAP ECC - PP2-005>,
#<DataConnection, id b9ddf35b-8fa1-4f45-a41d-c873e600ca7c, name SAP ECC - PS1-090>



# Specify the required table schemas in a python list
#To acess the Schema Name you have to get the connection informations
#pool.data_connections
tableSchema = [
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_9363d8e4-bbd1-4454-ab9f-b115ab31aa5c',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_77f18ab5-b465-4e03-8f67-0272cd01ddfb',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_310d0ab5-5bb5-4d64-8a34-84bc93121d58',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_8adecd8c-3535-43d2-bb7c-af12f175e8f5',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_a61e719d-5566-4328-b183-1d393f8879aa',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_b6fbc486-9719-4d69-87dc-50a471c5f95f',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_def198a6-426d-4ccb-b0ec-52dc2d1c519a',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_98f12823-2c82-4df3-a4e0-3f932fb27879',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_d04e6dc0-5b53-420a-b624-8eed5d1b7db7',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_621b2b5e-1c46-4e81-b13b-15bc607ff983',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_ffdff050-1fe4-43aa-ae9a-cd4763450e59',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_5a2082de-1aec-4bff-850c-7a923f2d094b',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_70f5784d-f0b6-4ce0-a368-6104c27a245b',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_7982c009-f641-4fa7-b74c-4c79febc733a',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_00409fbb-dad1-444e-90c1-c026cf6b9588',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_90db209c-f801-4c03-90d2-dac4c191ba9b',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_7a3bafc7-ae0a-4c96-82bf-0e16ba8ff97d',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_1c0a359a-f05b-4fa7-8cac-b0018a68ee74',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_920b7d87-7487-47b2-b46a-0727145161ce',
'e1bd9ca9-9d3b-44b4-9c17-ae345f663e27_b9ddf35b-8fa1-4f45-a41d-c873e600ca7c'    
]

unify_tables(url = url, api_token = api_token, datapool = datapool, tables = tables, tableSchema = tableSchema, function = function)