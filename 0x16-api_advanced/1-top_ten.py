#!/usr/bin/python3
"""
Module to query the Reddit API for the top ten hot posts of a subreddit
"""
import requests


def top_ten(subreddit):
    """
    Prints the titles of the first 10 hot posts listed for a given subreddit.
    """
    if subreddit is None or type(subreddit) is not str:
        print(None)
        return

    url = "https://www.reddit.com/r/{}/hot/.json".format(subreddit)
    headers = {
        'User-Agent': ('Python:alx-system_engineering-devops:v1.0 '
                       '(by /u/AmineLamuadni)')
    }
    params = {
        "limit": 10
    }

    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)
    if response.status_code == 404:
        print(None)
        return
    posts = response.json().get("data").get("children")
    for post in posts:
        print(post.get("data").get("title"))


if __name__ == "__main__":
    pass
