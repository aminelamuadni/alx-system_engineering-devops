#!/usr/bin/python3
"""
Script to export data about an employee's TODO list progress to a CSV file.
"""


import csv
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


def export_to_csv(user_id):
    """Export user's TODO list to a CSV file."""
    user = fetch_user_data(user_id)
    todos = fetch_todo_data(user_id)

    with open(f"{user_id}.csv", 'w', newline='') as csvfile:
        writer = csv.writer(csvfile, quoting=csv.QUOTE_ALL)
        for todo in todos:
            writer.writerow([user_id, user['username'], todo['completed'],
                todo['title']])


def main(employee_id):
    export_to_csv(employee_id)


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
