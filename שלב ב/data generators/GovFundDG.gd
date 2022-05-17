
[General]
Version=1

[Preferences]
Username=
Password=2413
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=GOVFUND
Count=10..20

[Record]
Name=SID
Type=NUMBER
Size=
Data=List(select sid from Source)
Master=

