#!/usr/bin/python3
"""
Write a function that queries the Reddit API
and prints the titles of the first 10 hot posts
"""
import requests


def top_ten(subreddit):
    """A function that queries the Reddit API
    and prints the titles of the first 10 hot posts"""
    if subreddit is None:
        print(None)
    title = 0
    user_agent = 'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0'
    params = {'limit': 10}
    headers = {'User-Agent': user_agent}
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    try:
        data = requests.get(url, headers=headers, params=params).json()
        titles = data.get('data').get('children')
        for title in titles:
            print(title.get('data').get('title'))
    except Exception as notValid:
        print(None)
