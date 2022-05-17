import random

com = ['Health', 'Education', 'Finance', 'Welfare', 'Sanitation', 'Plenum', 'Audit', 'Tourism', 'Sports', 'Community']
party = ['Likud', 'Yesh Atid', 'Zionut Datit', 'Merets', 'Avoda', 'Shas', 'Yahadut Hatora']

E = open(r"C:\Users\neria\DataGripProjects\Municipality\POLEMP.csv", 'r', encoding='utf-8')
E = E.read()

sql1 = 'insert into SYSTEM.COMMITTEE(name,role,ID) values '
sql2 = 'insert into SYSTEM.CHAIRMAN(ID) values '
Erows = E.split('\n')
Erows = [i.split(',') for i in Erows]

target1 = open(r"C:\Users\neria\DataGripProjects\Municipality\DGCommittee.sql", 'w')
target2 = open(r"C:\Users\neria\DataGripProjects\Municipality\DGChairman.sql", 'w')

for i in range(10):
    target1.write(sql1 + '(\'' + com[i] + '\',\'' + com[i] + '\',\'' + str(Erows[i][1]) + '\')' + ';\n')
    target2.write(sql2 + '(\'' +str(Erows[i][1]) + '\')' + ';\n')

target1.close()
target2.close()
