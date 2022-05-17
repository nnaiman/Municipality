
[General]
Version=1

[Preferences]
Username=
Password=2348
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=SOURCE
Count=30

[Record]
Name=AMOUNT
Type=NUMBER
Size=
Data=Random(1000, 4000)
Master=

[Record]
Name=SDATE
Type=DATE
Size=
Data=Random(01/01/2019, 31/12/2021)
Master=

[Record]
Name=SID
Type=NUMBER
Size=
Data=Sequence(1, [1])
Master=

[Record]
Name=YEAR
Type=NUMBER
Size=
Data=List(select year from Budget)
Master=

