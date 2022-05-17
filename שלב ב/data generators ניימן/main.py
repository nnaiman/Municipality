import random

com = ['Health', 'Education', 'Finance', 'Welfare', 'Sanitation', 'Plenum', 'Audit', 'Tourism', 'Sports', 'Community']
party = ['Likud', 'Yesh Atid', 'Zionut Datit', 'Merets', 'Avoda', 'Shas', 'Yahadut Hatora']

count = 0
E = open(r"C:\Users\neria\DataGripProjects\Municipality\EMPLOYEE.csv", 'r', encoding='utf-8')
E = E.read()
R = open(r"C:\Users\neria\DataGripProjects\Municipality\RESIDENT.csv", 'r', encoding='utf-8').read()
sql = 'insert into SYSTEM.POLEMP(party,ID) values '
Erows = E.split('\n')
Erows = [i.split(',') for i in Erows]
Rrows = R.split('\n')
Rrows = [i.split(',') for i in Rrows]
target = open(r"C:\Users\neria\DataGripProjects\Municipality\DGPolemp.sql", 'w')

for i in range(len(Erows) - 1):
    for j in range(len(Rrows) - 1):
        if Erows[i][0] == Rrows[j][0] and count < 25:
            target.write(sql + '(\'' + party[random.randint(0, len(party) - 1)] + '\',' + str(Erows[i][0]) + ')' + ';\n')
            count += 1
target.close()
print(count)
