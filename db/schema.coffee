ContactDataEntry = define 'ContactDataEntry', ->
	property 'type', String
	property 'name', String
	property 'value', String
	property 'default', Boolean

Contact = define 'Contact', ->
    property 'name', String
    property 'phonetic', String
    property 'birthday', Date
    property 'Job', String
    property 'Company', String
    property 'Notes', String
    property 'datas', [ContactDataEntry]