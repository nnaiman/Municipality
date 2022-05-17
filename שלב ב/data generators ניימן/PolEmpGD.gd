
[General]
Version=1

[Preferences]
Username=
Password=2493
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=POLEMP
Count=35

[Record]
Name=PARTY
Type=VARCHAR2
Size=20
Data=List('Likud', 'Yesh Atid','Zionut Datit','Merets')
Master=

[Record]
Name=ID
Type=NUMBER
Size=
Data=List(select ID from Employee natural join Resident)
Master=

