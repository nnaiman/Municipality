
[General]
Version=1

[Preferences]
Username=
Password=2126
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=INSTITUTION
Count=500

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=30
Data=Address1
Master=

[Record]
Name=INSTNAME
Type=VARCHAR2
Size=30
Data=[@@@@@@@@@@]
Master=

[Record]
Name=TYPE
Type=VARCHAR2
Size=20
Data=List('Landfill','university','School','clinic','Bank','Museum','Nursing Home','Hospital','Visitors center','Sports hall','Mall','Stadium','Synagogue','Park','Community center','Nature site')
Master=

[Record]
Name=COMMITNAME
Type=VARCHAR2
Size=30
Data=List(select cname from committee)
Master=

