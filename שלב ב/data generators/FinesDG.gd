
[General]
Version=1

[Preferences]
Username=
Password=2738
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=FINES
Count=250

[Record]
Name=REASON
Type=VARCHAR2
Size=40
Data=List('Parking', 'Speeding', 'No Mask' ,'Littering', 'Crime' ,'Other')
Master=

[Record]
Name=SID
Type=NUMBER
Size=
Data=List(select sid from ((select sid from Collection) MINUS (select sid from Taxes)))
Master=

[Record]
Name=IID
Type=NUMBER
Size=
Data=List(select id from Inspector)
Master=

