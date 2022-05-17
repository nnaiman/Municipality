
[General]
Version=1

[Preferences]
Username=
Password=2028
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=TAXES
Count=250

[Record]
Name=TYPE
Type=VARCHAR2
Size=10
Data=List('Income', 'Corporate', 'VAT', 'Arnona', 'Fee')
Master=

[Record]
Name=SID
Type=NUMBER
Size=
Data=distinct List(select sid from Collection)
Master=

