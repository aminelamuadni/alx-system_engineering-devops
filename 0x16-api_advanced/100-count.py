#!/usr/bin/python3
"""
Module to recursively query the Reddit API and count words in hot article
titles
"""
import requests
import re


def count_words(subreddit, word_list, after="", word_count={}):
    """
    Recursively queries the Reddit API, parses the title of all hot articles,
    and prints a sorted count of given keywords.
    """
    if after is None:
        sorted_words = sorted(word_count.items(), key=lambda x: (-x[1], x[0]))
        for word, count in sorted_words:
            if count > 0:
                print("{}: {}".format(word, count))
        return

    if after == "":
        word_count = {word.lower(): 0 for word in word_list}

    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    params = {"limit": 100, "after": after}
    headers = {
        'User-Agent': ('Python:alx-system_engineering-devops:v1.0 '
                       '(by /u/AmineLamuadni)')
    }
    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)

    if response.status_code != 200:
        return

    data = response.json().get("data")
    after = data.get("after")
    posts = data.get("children", [])

    for post in posts:
        title = post.get("data", {}).get("title", "").lower()
        for word in word_count:
            word_count[word] += len(re.findall(r'\b{}\b'
                                               .format(re.escape(word)),
                                               title))

    count_words(subreddit, word_list, after, word_count)


if __name__ == "__main__":
    pass
