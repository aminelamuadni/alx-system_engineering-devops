#!/usr/bin/python3
"""
Module to recursively query the Reddit API for all hot articles of a subreddit
"""
import requests


def recurse(subreddit, hot_list=[], after=""):
    """
    Recursively queries the Reddit API and returns a list of titles of all hot
    articles for a given subreddit.
    """
    url = ("https://www.reddit.com/r/{}/hot.json?limit=100&after={}"
           .format(subreddit, after))
    headers = {
        'User-Agent': ('Python:alx-system_engineering-devops:v1.0 '
                       '(by /u/AmineLamuadni)')
    }

    try:
        response = requests.get(url, headers=headers, allow_redirects=False)
        if response.status_code != 200:
            return None

        data = response.json().get("data", {})
        after = data.get("after")
        posts = data.get("children", [])

        for post in posts:
            hot_list.append(post.get("data", {}).get("title"))

        if after is not None:
            return recurse(subreddit, hot_list, after)
        return hot_list
    except requests.RequestException:
        return None


if __name__ == "__main__":
    pass
