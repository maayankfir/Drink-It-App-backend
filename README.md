# Redux Boozer API

## Objectives
+ Practice connecting our client-side applications to an API
+ Create and handle forms with Redux.

## Overview
Today, we'll be connecting our Redux application to an API so we can actually start loading and persisting data! 

Fork and clone this repo. We've provided a seed file with a list of cocktails (shout out to PDT for their list. )

We've setup two endpoints for you - visiting `http:localhost:3000/api/v1/cocktails` provides us with a list of all cocktails. Cocktails have many proportions, which include an amount and an ingredient name.

## Instructions for Server Side code

On the server-side, build out a create action which creates a new cocktail. Hint: You'll probably want to be able to create new proportions and ingredients along with this.
