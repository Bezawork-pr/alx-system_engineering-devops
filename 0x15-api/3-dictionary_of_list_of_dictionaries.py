#!/usr/bin/python3
"""
Using what you did in the task #0,
extend your Python script to export data in the JSON format
of all the employees
Write a Python script that, using this REST API,
for a given employee ID, returns information about
his/her TODO list progress.
"""
import json
import requests

if __name__ == "__main__":
    total_task = 0
    completed_task = 0
    url = "https://jsonplaceholder.typicode.com"
    employees = requests.get("{}/users".format(url)).json()
    dict_1 = {}
    dict_2 = {}
    my_list = []
    for employee in employees:
        employee_id = employee.get('id')
        todos = requests.get("{}/todos?userId={}".format(url,
                                                         employee_id)).json()
        for task in todos:
            dict_2['username'] = employee.get('username')
            dict_2['task'] = task.get('title')
            dict_2['completed'] = task.get('completed')
            my_list.append(dict_2)
            dict_2 = {}
        dict_1[employee.get('id')] = my_list
        my_list = []
    with open("todo_all_employees.json", "w") as jsonfile:
        json.dump(dict_1, jsonfile)
