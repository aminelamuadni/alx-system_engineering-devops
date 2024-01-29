#!/usr/bin/python3
"""
Script to gather data from an API and display information about an employee's
TODO list progress for a given employee ID.
"""


import requests
import sys


def fetch_user_data(user_id):
    """Fetch user data from the JSONPlaceholder API."""
    user_url = f"https://jsonplaceholder.typicode.com/users/{user_id}"
    return requests.get(user_url).json()


def fetch_todo_data(user_id):
    """Fetch TODO list data for a user from the JSONPlaceholder API."""
    todos_url = f"https://jsonplaceholder.typicode.com/todos?userId={user_id}"
    return requests.get(todos_url).json()


def display_todo_progress(user, todos):
    """Display the progress of the user's TODO list."""
    completed_tasks = [todo for todo in todos if todo['completed']]
    print(f"Employee {user['name']} is done with tasks("
          f"{len(completed_tasks)}/{len(todos)}):")
    for task in completed_tasks:
        print(f"\t {task['title']}")


def main(employee_id):
    user = fetch_user_data(employee_id)
    todos = fetch_todo_data(employee_id)
    display_todo_progress(user, todos)


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
