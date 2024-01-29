#!/usr/bin/python3
"""
Script to export data about an employee's TODO list progress to a JSON file.
"""


import json
import requests
import sys


def fetch_user_data(user_id):
    """Fetch user data from JSONPlaceholder API."""
    user_url = f"https://jsonplaceholder.typicode.com/users/{user_id}"
    return requests.get(user_url).json()


def fetch_todo_data(user_id):
    """Fetch TODO list data for a user from JSONPlaceholder API."""
    todos_url = f"https://jsonplaceholder.typicode.com/todos?userId={user_id}"
    return requests.get(todos_url).json()


def export_to_json(user_id, user_data, todos_data):
    """Export user's TODO list to a JSON file."""
    todos_list = []
    for todo in todos_data:
        todo_dict = {
            "task": todo['title'],
            "completed": todo['completed'],
            "username": user_data['username']
        }
        todos_list.append(todo_dict)

    with open(f"{user_id}.json", 'w') as jsonfile:
        json.dump({str(user_id): todos_list}, jsonfile)


def main(employee_id):
    user = fetch_user_data(employee_id)
    todos = fetch_todo_data(employee_id)
    export_to_json(employee_id, user, todos)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: {} <employee_id>".format(sys.argv[0]))
        sys.exit(1)

    try:
        employee_id = int(sys.argv[1])
        main(employee_id)
    except ValueError:
        print("Error: Employee ID must be an integer.")
        sys.exit(1)
