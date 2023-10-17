import pandas as pd

def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:

    # sort the dataframe by the salary in descending order
    sorted_df = employee.sort_values(by='salary', ascending=False)
    
    # drop any duplicate salary values
    unique_salaries = sorted_df['salary'].drop_duplicates()
    
    # select the second highest salary
    if len(unique_salaries) < 2:
        second_highest = None
    else:
        second_highest = unique_salaries.iloc[1]
    
    # create a new DataFrame with the second highest salary
    result = pd.DataFrame({'SecondHighestSalary': [second_highest]})
    
    return result
