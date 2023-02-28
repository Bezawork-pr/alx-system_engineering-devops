#!/usr/bin/python3
"""
This file contains a function that gets number of subscribers
from reddit API
"""
import requests


def number_of_subscribers(subreddit):
    """Get number of subscribers"""
    if subreddit is None:
        return 0
    subscribers = 0
    user_agent = 'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0'
    headers = {'User-Agent': user_agent}
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    try:
        data = requests.get(url, headers=headers).json()
        subscribers = data.get('data').get('subscribers')
    except Exception as notValid:
        pass
    return subscribers
