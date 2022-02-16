#!/usr/bin/python3
"""Reddit API"""
import requests


def recurse(subreddit, hot_list=[], after=None):
    """Get all articles by recursion"""
    url = 'https://www.reddit.com/r/{}/hot.json?after={}'.format(
        subreddit, after)
    header = {'User-Agent': 'MyHolbertonAPI/0.0.1'}

    rep = requests.get(url, headers=header)

    if rep.status_code == 200:
        hotPosts = rep.json()['data']['children']
        after = rep.json()['data']['after']

        for post in hotPosts:
            hot_list.append(post['data']['title'])

        if after is not None:
            recurse(subreddit, hot_list, after)

        return hot_list
    else:
        return None
