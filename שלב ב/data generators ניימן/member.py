import random

com = ['Health', 'Education', 'Finance', 'Welfare', 'Sanitation', 'Plenum', 'Audit', 'Tourism', 'Sports', 'Community']
party = ['Likud', 'Yesh Atid', 'Zionut Datit', 'Merets', 'Avoda', 'Shas', 'Yahadut Hatora']

E = open(r"C:\Users\neria\DataGripProjects\Municipality\POLEMP.csv", 'r', encoding='utf-8').read()
C = open(r"C:\Users\neria\DataGripProjects\Municipality\COMMITTEE.csv", 'r', encoding='utf-8').read()
# P = open(r"C:\Users\neria\DataGripProjects\Municipality\CHAIRMAN.csv", 'r', encoding='utf-8').read()


sql1 = 'insert into SYSTEM.MEMBER(ID) values '
sql2 = 'insert into SYSTEM.MEMBERAT(name, ID) values '
Erows = E.split('\n')
Erows = [i.split(',') for i in Erows]
Crows = C.split('\n')
Crows = [i.split(',') for i in Crows]

target1 = open(r"C:\Users\neria\DataGripProjects\Municipality\DGMember.sql", 'w')
target2 = open(r"C:\Users\neria\DataGripProjects\Municipality\DGMemberAt.sql", 'w')

tmp = [i[-1] for i in Crows]
tmp2 = [i[-1] for i in Erows if i[-1] not in tmp]
[target1.write(sql1 + '(\'' + str(tmp2[i]) + '\')' + ';\n') for i in range(len(tmp2))]

for i in com:
    [target2.write(sql2 + '(\'' + i + '\',\'' + str(tmp2[random.randint(0, len(tmp2) - 1)]) + '\')' + ';\n') for j in
     range(4)]

target1.close()
target2.close()
