
[General]
Version=1

[Preferences]
Username=
Password=2314
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=COLLECTION
Count=10..20

[Record]
Name=ID
Type=NUMBER
Size=
Data=List(select id from ((select id from resident) union (select num from randomnumbers)))
Master=

[Record]
Name=SID
Type=NUMBER
Size=
Data=List(select sid from ((select sid from Source) MINUS (select sid from GovFund)))
Master=

