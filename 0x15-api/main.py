#!/usr/bin/python3
"""
Checks student output for returning info from REST API
"""

import requests
import sys

users_url = "https://jsonplaceholder.typicode.com/users"
todos_url = "https://jsonplaceholder.typicode.com/todos"


def check_tasks(id):
    """ Fetch user name, number of tasks """

    resp = requests.get(todos_url).json()

    filename = 'student_output'
    count = 0
    with open(filename, 'r') as f:
        next(f)
        for line in f:
            count += 1
            if line[0] is '\t':
                print('ok')
            else:
                print('Not a tab')
            if line[0] is ' ':
                print('ok')
            else:
                print('Not a space')
            if line[0] is '\n':
                print('ok')
            else:
                print('Not a next line')
            if line[0] is '\t' and line[1] is ' ' and line[-1] is '\n':
                print("Task {} Formatting: OK".format(count))
            else:
                print("Task {} Formatting: Incorrect".format(count))


if __name__ == "__main__":
    check_tasks(2)
