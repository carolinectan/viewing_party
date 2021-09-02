# Viewing Party


## Table of Contents
- [Overview](#overview)
- [Learning Goals](#learning-goals)
- [Tools Used](#tools-used)
- [Local Setup](#getting-started)
- [Database Schema](#database-schema)
- [Contributors](#contributors)

## Overview
[Viewing Party](https://github.com/InOmn1aParatus/viewing_party) is a 10-day, paired project during Turing School of Software and Design's Back-End Engineering program in Module 3. The goal was to create a Rails application that consumes APIs, where users can explore movie options and create a viewing party event for the user and friends. The database utilizes a self-referential relationship to allow users to have friends, similar to follower functionality on Twitter.

This application is built off of the base repo for the [viewing party project](https://backend.turing.io/module3/projects/viewing_party) used for Turing's Backend Module 3.

![](header.png)

## Learning Goals

Example wireframes [here](https://backend.turing.io/module3/projects/viewing_party/wireframes)

## Local Setup

1. Fork repo: [repo](https://github.com/InOmn1aParatus/viewing_party)
2. Clone repo: Run `git clone` <SSH link>.
3. Change into application's directory: `cd viewing_party`
3. Install gem packages: Run `bundle install`
4. Setup the database: `rails db:{create, migrate, seed}`

## Database Schema

[![Screen-Shot-2021-09-01-at-5-04-10-PM.png](https://i.postimg.cc/Df5s6Vn7/Screen-Shot-2021-09-01-at-5-04-10-PM.png)](https://postimg.cc/s1QvfNML)
  
## Tools Used

| Development | Testing       | Gems            |
|   :----:    |    :----:     |    :----:       |
| Ruby 2.7.2  | RSpec         | Pry             |
| Rails 5.2.5 | WebMock       | ShouldaMatchers |
| HTML5       | VCR           | Capybara        |
| CSS3        | Launchy       | Figaro          |
| VSCode      | SimpleCov     | Travis          |
| Atom        | Capybara      | BCrypt          |
| Github      |               |                 |

## Contributors

👤  **Caroline Tan**
- [GitHub](https://github.com/carolinectan)
- [LinkedIn](https://www.linkedin.com/in/carolinectan/)

👤  **Matt Kragen**
- [GitHub](https://github.com/InOmn1aParatus)
- [LinkedIn](https://www.linkedin.com/in/mattkragen/)
