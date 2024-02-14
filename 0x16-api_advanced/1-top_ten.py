#!/usr/bin/python3
"""
Module to query the Reddit API for the top ten hot posts of a subreddit
"""
import requests


def top_ten(subreddit):
    """
    Prints the titles of the first 10 hot posts listed for a given subreddit.
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json?limit=10"
    headers = {
        'User-Agent': ('Python:alx-system_engineering-devops:v1.0 '
                       '(by /u/AmineLamuadni)')
    }

    try:
        response = requests.get(url, headers=headers, allow_redirects=False)
        if response.status_code != 200:
            print(None)
            return
        if not response.text:
            print(None)
            return
        posts = response.json().get("data", {}).get("children", [])
        for post in posts:
            print(post.get("data", {}).get("title"))
    except requests.RequestException:
        print(None)


if __name__ == "__main__":
    pass
