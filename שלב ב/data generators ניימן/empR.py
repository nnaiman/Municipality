# E = open(r"C:\Users\neria\DataGripProjects\Municipality\MOCK_DATA.csv", 'r', encoding='utf-8')
# E = E.read()
# Erows = E.split('\n')
# Erows = [i.split(',') for i in Erows]
# R = open(r"C:\Users\neria\DataGripProjects\Municipality\RESIDENT.csv", 'r', encoding='utf-8').read()
# sql = 'insert into SYSTEM.Employee(ID, NAME, ADDRESS, PHONE, SALARY, BANKDETAIL, ROLE, EMAIL) values '
# Rrows = R.split('\n')
# Rrows = [i.split(',') for i in Rrows]
# target = open(r"C:\Users\neria\DataGripProjects\Municipality\DGEmployeeR.sql", 'w')

# t = [target.write(sql + "(" + ', '.join(
#   [Rrows[i][0]] + [str("'" + Rrows[i][1] + "'")] + [str("'" + Rrows[i][-1].replace("'", "''") + "'")] + [
#      ("'0" + str(Rrows[i][2])) + "'"] + [Erows[i][-1]] + [str("'" + Erows[i][-2] + "'")] + [
#     str("'" + Erows[i][0][:20] + "'")] + [str("'" + Rrows[i][3] + "'")]) + ");\n") for i in range(100)]
