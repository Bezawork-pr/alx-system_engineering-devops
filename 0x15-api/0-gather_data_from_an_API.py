#!/usr/bin/python3
"""
Write a Python script that, using this REST API,
for a given employee ID, returns information about
his/her TODO list progress.

First line: Employee EMPLOYEE_NAME is done
with tasks(NUMBER_OF_DONE_TASKS/TOTAL_NUMBER_OF_TASKS):
    EMPLOYEE_NAME: name of the employee
    NUMBER_OF_DONE_TASKS: number of completed tasks
    TOTAL_NUMBER_OF_TASKS: total number of tasks,
        which is the sum of completed and non-completed tasks
    Second and N next lines display the title of completed tasks:
        TASK_TITLE (with 1 tabulation and 1 space before the TASK_TITLE)
"""
from sys import argv
import requests

employee_id = argv[1]
total_task = 0
completed_task = 0
url = "https://jsonplaceholder.typicode.com/users"
employee = requests.get("{}/{}".format(url, employee_id)).json()
todos = requests.get("{}/{}/todos".format(url, employee_id)).json()
employee_name = employee['name']
for i in range(len(todos)):
    total_task = total_task + 1
    if todos[i]['completed'] is True:
        completed_task = completed_task + 1
string = "Employee {} is done with tasks({}/{})".format(
                employee_name, completed_task, total_task)
print(string)
for i in range(len(todos)):
    if todos[i]['completed'] is True:
        print("\t{}".format(todos[i]['title']))
