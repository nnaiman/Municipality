
[General]
Version=1

[Preferences]
Username=
Password=2228
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=DONATION
Count=126

[Record]
Name=SID
Type=NUMBER
Size=
Data=List(select sid from (((select sid from Source) MINUS (select sid from GovFund)) MINUS (select sid from Collection)))
Master=

[Record]
Name=DID
Type=NUMBER
Size=
Data=List(select id from donor)
Master=

