
[General]
Version=1

[Preferences]
Username=
Password=2910
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=RESIDENT
Count=5000

[Record]
Name=ID
Type=NUMBER
Size=
Data=Random(100000000, 999999999)
Master=

[Record]
Name=NAME
Type=VARCHAR2
Size=30
Data=FirstName + ' ' + LastName
Master=

[Record]
Name=PHONE
Type=VARCHAR2
Size=11
Data=['05'99999999]
Master=

[Record]
Name=EMAIL
Type=VARCHAR2
Size=30
Data=Email
Master=

[Record]
Name=MAIL
Type=VARCHAR2
Size=30
Data=ZIP
Master=

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=30
Data=Address1
Master=

