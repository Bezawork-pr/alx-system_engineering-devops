#!/usr/bin/python3
"""
Using what you did in the task #0,
extend your Python script to export data in the CSV format.
Records all tasks that are owned by this employee
Format must be: "USER_ID","USERNAME","TASK_COMPLETED_STATUS","TASK_TITLE"
File name must be: USER_ID.csv
"""
import requests
from sys import argv
import csv

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
    string = "Employee {} is done with tasks({}/{})".format(
                   employee_name, completed_task, total_task)
    print(string)
    for i in range(len(todos)):
        if todos[i]['completed'] is True:
            print("\t{}".format(todos[i]['title']))
    user_id = todos[i].get('userId')
    user_name = todos[i].get('id')
    with open('USER_ID', 'w', newline='') as csvfile:
        fieldnames = ["USER_ID", "USERNAME", "TASK_COMPLETED_STATUS",
                      "TASK_TITLE"]
        thewriter = csv.DictWriter(csvfile, fieldnames=fieldnames)
        for i in range(len(todos)):
            completed = todos[i].get('completed')
            title = todos[i].get('title')
            thewriter.writerow(({'USER_ID': user_id,
                                'USERNAME': user_name,
                                 'TASK_COMPLETED_STATUS': completed,
                                 'TASK_TITLE': title}))
