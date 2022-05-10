"""
Aaron Lim
005893468
CSE308 - Lab1
Python-Data Manipulation and Visualization
"""

import pandas as pd # import the entire numpy package, giving it the alias 'np'
import numpy as np # import the entire numpy package, giving it the alias 'np'

df = pd.read_csv('car_loan.csv') #Load sample data (car_loan.csv) into data frame: df
df.to_csv('out.csv') #Export Pandas DataFrames to csv. Save file name as out.csv. hint: help(df.to_csv)
df.info() #Run the command: df.info (). 
"""
What do you see, how many columns? also what about number of entries for each column

Answer:
    Columns: 
        9 total
    Entries per column:
        Mostly 60 except for Interest Paid, which is 59

"""
#It is often the case where you change your column names or remove unnecessary columns.
#a. Change the following columns names: 
#Starting Balance: starting_balance
#Interest Paid: interest_paid
#Principal Paid: principal_paid
#New Balance': new_balance
df = pd.read_csv('car_loan.csv', skiprows = 1, names = ['Month', 'starting_balance', 'Repayment', 'interest_paid', 'principal_paid', 'new_balance', 'term', 'interest_rate', 'cartype']) # Rename all of the columns, keeping them in order
df.to_csv('out.csv') #Export Pandas DataFrames to csv. Save file name as out.csv. hint: help(df.to_csv)

##b. Remove the two columns “term”, and “Repayment”.
del df['term']
del df['Repayment']
df.to_csv('out.csv') #Export Pandas DataFrames to csv. Save file name as out.csv. hint: help(df.to_csv)

interest_missing = df['interest_paid'].isna()
print(interest_missing)
"""
Run the command: interest_missing = df['interest_paid'].isna(), what do you see ?
    Answer:
        Row 35 is the out.csv(or row 36 in the car_loan.csv) file is empty aka. True since the datatype is a bool

"""

"""
Can you fix the problem in 6 above? 
hint: use the function df.loc. property DataFrame.loc: Access a group of rows and columns by label(s) or a boolean array.

    Answer:
        Yes, by using the command df['interest_paid'].loc[35] = 0

"""
df['interest_paid'].loc[35] = 0
df.to_csv('out.csv') #Export Pandas DataFrames to csv. Save file name as out.csv. hint: help(df.to_csv)
#interest_missing = df['interest_paid'].isna()
#print(interest_missing)

iptotal = df['interest_paid'].sum() ##Find the total = amount of interest paid over the course of the loan
print(iptotal) 
"""
Answer:
    interest_paid = 6450.2699999999995
"""

"""
Find the sum of all values across all columns
    Answer:
        2245480.741999999
"""
total = df.sum(axis = 1) 
print(total) 
total2 = sum(total)
print(total2) ##sum of all table row + col = 2245480.741999999

df.to_numpy() ##Convert Pandas DataFrames to NumPy arrays

import matplotlib.pyplot as plt ##Import the library pyplot from matplotlib and create alias plt 
import seaborn as sns ##import seaborn library (wrapper of matplotlib) and create alias: sns

##library (wrapper of matplotlib) and create alias: sns
##13. load data out.csv
##use the loc property to find the values of the followings: month_numbe, interest_paid, principal_paid.
month_number = df.loc[:, 'Month'].values
print()
print('----Month_number:----')
print(month_number)
interest_paid = df.loc[:, 'interest_paid'].values
print()
print('----interest_paid:----')
print(interest_paid)
principal_paid = df.loc[:, 'principal_paid'].values
print()
print('----principal_paid:----')
print(principal_paid)

##Check the type of the month_number array?
print()
type_ = month_number.dtype
print('month_number datatype is: ', type_)

##Plot the interest paid vs the number of months.
plt.plot(month_number, interest_paid, color = 'black')
#plt.xlabel('month_number')
#plt.ylabel('interest_paid')

##On the same graph plot the principal paid vs the number of months
plt.plot(month_number, principal_paid, color = 'blue')
#plt.xlabel('month_number')
#plt.ylabel('interest_paid / principal_paid')
plt.xlabel('Month')
plt.ylabel('Dollars')
plt.title('Interest and Principal Paid Each Month')

styles = plt.style.available ##you can use plt.style.available to select an appropriate aesthetic styles for your figures. 
print('styles: ')
print(styles)
#plt.style.use('seaborn-deep')

#plt.style.use('classic') #Re-do 16 and 17 using the “plt.style.use('classic')”. What did you notice different?
#print('What did you notice different?')
#print('Answer: ')
#print('Graph is bigger, principal pay vs month is line is RED and interest vs month is BLUE and has a grey border') 
#plt.style.use('fivethirtyeight') #Re-do 19 using the “plt.style.use(‘fivethirtyeight’)”. What did you notice different? 
#print('What did you notice different?')
#print('Answer: ')
#print('Graph is better, principal pay vs month is line is Green and interest vs month is BLUEand has a grey border') 
plt.style.use('seaborn') #Re-do 19 using the “plt.style.use(‘seaborn’)”. What did you notice different? 
print('What did you notice different?')
print('Answer: ')
print('Graph is better, principal pay vs month is line is Green and interest vs month is BLUE, no border') 


plt.legend(['interest paid vs the number of months', 'principal paid vs the number of months'], loc = 'center right') ## Add legend to your figures. Add it to be center right. 
##plt.show()
plt.savefig('plot.png')
































