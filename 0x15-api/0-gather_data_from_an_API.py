#!/usr/bin/python3
"""
Write a Python script that, using this REST API,
for a given employee ID, returns information about
his/her TODO list progress.
"""
from sys import argv
import requests

if __name__ == "__main__":
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
    string = "Employee {} is done with tasks({}/{}):".format(
                    employee_name, completed_task, total_task)
    print(string)
    for i in range(len(todos)):
        if todos[i]['completed'] is True:
            print("\t{}".format(todos[i]['title']))
