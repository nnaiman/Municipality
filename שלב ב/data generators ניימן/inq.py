import random

com = ['Health', 'Education', 'Finance', 'Welfare', 'Sanitation', 'Plenum', 'Audit', 'Tourism', 'Sports', 'Community']
party = ['Likud', 'Yesh Atid', 'Zionut Datit', 'Merets', 'Avoda', 'Shas', 'Yahadut Hatora']

count = 0
E = open(r"C:\Users\neria\DataGripProjects\Municipality\inq.csv", 'r', encoding='utf-8').read()
R = open(r"C:\Users\neria\DataGripProjects\Municipality\inq1.csv", 'r', encoding='utf-8').read()
P = open(r"C:\Users\neria\DataGripProjects\Municipality\INQUIRIES.csv", 'r', encoding='utf-8').read()

sql = 'insert into SYSTEM.INQUIRIES(IID,IDATE,TYPE,DETAILS,STATUS,ID,COMMITNAME) values '
Erows = E.split('\n')
Erows = [i.split(',') for i in Erows]
Rrows = R.split('\n')
Rrows = [i.split(',') for i in Rrows]
Prows = P.split('\n')
Prows = [i.split(',') for i in Prows]
tmp = [i[0] for i in Prows]

print(tmp)
print([i for i in range(2000) if (str(i)) not in tmp])


#target = open(r"C:\Users\neria\DataGripProjects\Municipality\DGInquiries.sql", 'w')

#for i in range(len(Erows) - 1):
 #   target.write(sql + '(' + str(i) + ',' + "TO_DATE('" + str(Erows[i][1]) + '\',' + "'DD/MM/YYYY')" + ',\'' + str(
  #      Erows[i][2]) + '\',\'' + str(Erows[i][3]) + '\',' + str(Erows[i][4]) + ',' + str(
   #     tmp[random.randint(0, len(tmp) - 1)]) + ',\'' + str(Erows[i][6]) + '\')' + ';\n')

#for i in range(1000, 2000):
    #target.write(
   #     sql + '(' + str(i) + ',' + "TO_DATE('" + str(Rrows[i - 1000][1]) + '\',' + " 'DD/MM/YYYY')" + ',\'' + str(
  #          Rrows[i - 1000][2]) + '\',\'' + str(Rrows[i - 1000][3]) + '\',' + str(Rrows[i - 1000][4]) + ',' + str(
 #           tmp[random.randint(0, len(tmp) - 1)]) + ',\'' + str(Rrows[i - 1000][6]) + '\')' + ';\n')
#
#target.close()
