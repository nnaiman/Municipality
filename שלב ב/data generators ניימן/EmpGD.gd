
[General]
Version=1

[Preferences]
Username=
Password=2548
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYSTEM
Name=EMPLOYEE
Count=1000

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
Name=ADDRESS
Type=VARCHAR2
Size=30
Data=Address1
Master=

[Record]
Name=PHONE
Type=VARCHAR2
Size=11
Data=['05'99999999]
Master=

[Record]
Name=SALARY
Type=NUMBER
Size=
Data=Random(5300, 530000)
Master=

[Record]
Name=BANKDETAIL
Type=VARCHAR2
Size=20
Data=Random(0, 100000)
Master=

[Record]
Name=ROLE
Type=VARCHAR2
Size=20
Data=[@@@@@@@@@@]
Master=

[Record]
Name=EMAIL
Type=VARCHAR2
Size=30
Data=Email
Master=

