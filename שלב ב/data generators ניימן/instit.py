import random

st = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
com = {'Health': ['hospital', 'clinic'], 'Education': ['university', 'school'], 'Finance': ['mall', 'bank'],
       'Welfare': ['Nursing Home'], 'Sanitation': ['Landfill'],
       'Tourism': ['visitors Center', 'museum', 'Nature site'], 'Sports': ['Sports hall', 'stadium'],
       'Community': ['synagogue', 'community Center', 'park']}

party = ['Likud', 'Yesh Atid', 'Zionut Datit', 'Merets', 'Avoda', 'Shas', 'Yahadut Hatora']

E = open(r"C:\Users\neria\DataGripProjects\Municipality\ADDR.csv", 'r', encoding='utf-8').read()
Erows = E.split('\n')

sql1 = 'insert into SYSTEM.INSTITUTION(address,instname,type,commitname) values '

target1 = open(r"C:\Users\neria\DataGripProjects\Municipality\DGInstitution.sql", 'w')

for i in range(500):
    j = list(com.keys())[random.randint(0, len(com) - 1)]
    target1.write(sql1 + '(\'' + str(Erows[i]) + '\',\'' + ''.join(
        ([st[random.randint(0, len(st) - 1)] for o in range(10)])) + '\',\'' +
                  com[j][random.randint(0, len(com[j])-1)] + '\',\'' +
                  str(j) + '\')' + ';\n')

target1.close()
