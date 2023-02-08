#!/usr/bin/python3
"""
Using what you did in the task #0,
extend your Python script to export data in the JSON format.
Write a Python script that, using this REST API,
for a given employee ID, returns information about
his/her TODO list progress.
"""
import json
import requests
from sys import argv

if __name__ == "__main__":
    employee_id = argv[1]
    total_task = 0
    completed_task = 0
    url = "https://jsonplaceholder.typicode.com/users"
    employee = requests.get("{}/{}".format(url, employee_id)).json()
    todos = requests.get("{}/{}/todos".format(url, employee_id)).json()
    employee_name = employee['name']
    user_name = employee['username']
    dict_1 = {}
    dict_2 = {}
    my_list = []
    for i in range(len(todos)):
        dict_2['task'] = todos[i].get('title')
        dict_2['completed'] = todos[i].get('completed')
        dict_2['username'] = user_name
        my_list.append(dict_2)
    dict_1[argv[1]] = my_list
    with open("{}.json".format(argv[1]), "w") as jsonfile:
        json.dump(dict_1, jsonfile)
