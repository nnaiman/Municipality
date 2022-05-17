
[General]
Version=1

[Preferences]
Username=
Password=2122
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=DONOR
Count=100

[Record]
Name=NAME
Type=VARCHAR2
Size=30
Data=FirstName + ' ' + LastName
Master=

[Record]
Name=ID
Type=NUMBER
Size=
Data=Random(100000000,999999999)
Master=

