#!/usr/bin/python3
"""
Script to export data about all employees' TODO lists to a JSON file.
"""


import json
import requests


def fetch_all_users():
    """Fetch data of all users from JSONPlaceholder API."""
    users_url = "https://jsonplaceholder.typicode.com/users"
    return requests.get(users_url).json()


def fetch_todo_data(user_id):
    """Fetch TODO list data for a user from JSONPlaceholder API."""
    todos_url = f"https://jsonplaceholder.typicode.com/todos?userId={user_id}"
    return requests.get(todos_url).json()


def export_all_to_json(users):
    """Export TODO lists of all users to a JSON file."""
    all_users_data = {}
    for user in users:
        todos = fetch_todo_data(user['id'])
        all_users_data[user['id']] = [{
            "username": user['username'],
            "task": todo['title'],
            "completed": todo['completed']
        } for todo in todos]

    with open("todo_all_employees.json", 'w') as jsonfile:
        json.dump(all_users_data, jsonfile)


def main():
    users = fetch_all_users()
    export_all_to_json(users)


if __name__ == "__main__":
    main()
