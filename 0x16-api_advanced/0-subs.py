#!/usr/bin/python3
import requests
"""Reddit API"""


def number_of_subscribers(subreddit):
    """Get reddit subscribers"""
    try:
        url = 'https://www.reddit.com/r/{subreddit}/about.json'.format(
            subreddit=subreddit)
        request = requests.get(
            url, headers={'User-agent': 'MyHolbertonAPI/0.0.1'})
        r = request.json()['data']['subscribers']
        return r
    except(Exception):
        return(0)
