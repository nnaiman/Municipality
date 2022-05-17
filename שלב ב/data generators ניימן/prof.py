import random

com = ['Health', 'Education', 'Finance', 'Welfare', 'Sanitation', 'Plenum', 'Audit', 'Tourism', 'Sports', 'Community']
party = ['Likud', 'Yesh Atid', 'Zionut Datit', 'Merets', 'Avoda', 'Shas', 'Yahadut Hatora']

E = open(r"C:\Users\neria\DataGripProjects\Municipality\EMPLOYEE.csv", 'r', encoding='utf-8')
E = E.read()
R = open(r"C:\Users\neria\DataGripProjects\Municipality\RESIDENT.csv", 'r', encoding='utf-8').read()
P = open(r"C:\Users\neria\DataGripProjects\Municipality\POLEMP.csv", 'r', encoding='utf-8').read()
sql = 'insert into SYSTEM.PROFEMP(ID) values '
Erows = E.split('\n')
Erows = [i.split(',') for i in Erows]
Rrows = R.split('\n')
Rrows = [i.split(',') for i in Rrows]
Prows = P.split('\n')
Prows = [i.split(',') for i in Prows]
target = open(r"C:\Users\neria\DataGripProjects\Municipality\DGProfemp.sql", 'w')

t = [Prows[k][1] for k in range(len(Prows) - 1)]
print(len(t))
for i in range(len(Erows) - 1):
    if Erows[i][0] not in t:
        target.write(sql + '(\'' + str(Erows[i][0]) + '\')' + ';\n')
target.close()
