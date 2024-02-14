#!/usr/bin/python3
"""
Module to query the Reddit API
"""
import requests


def number_of_subscribers(subreddit):
    """
    Queries the Reddit API and returns the number of subscribers for a given
    subreddit.
    """
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {
        'User-Agent': ('Python:alx-system_engineering-devops:v1.0 '
                       '(by /u/AmineLamuadni)')
    }

    try:
        response = requests.get(url, headers=headers, allow_redirects=False)
        if response.status_code != 200:
            return 0
        if not response.text:
            return 0
        return response.json().get("data", {}).get("subscribers", 0)
    except requests.RequestException:
        return 0


if __name__ == "__main__":
    pass
