# Tendable Coding Assessment

## Usage

```sh
bundle
ruby questionnaire.rb
```

## Goal 

The goal is to implement a survey where a user should be able to answer a series of Yes/No questions. After each run, a rating is calculated to let them know how they did. Another rating is also calculated to provide an overall score for all runs.

## Requirements

Possible question answers are: "Yes", "No", "Y", or "N" case insensitively to answer each question prompt.

The answers will need to be **persisted** so they can be used in calculations for subsequent runs >> it is proposed you use the pstore for this, already included in the Gemfile

After _each_ run the program should calculate and print a rating. The calculation for the rating is: `100 * number of yes answers / number of questions`.

The program should also print an average rating for all runs.

The questions can be found in questionnaire.rb

Ensure we can run your exercise

## Bonus Points

Updated readme with an explanation of your approach

Unit Tests

Code Comments

Dockerfile / Bash script if needed for us to run the exercise

## How to run and use

To run the application you should run a command 
```sh
docker build -t run-ruby-with-gems
```
After that run 
```sh
docker run -it --rm run-ruby-with-gems
```
After first message you should answer questions with "Yes", "No", "Y", or "N" variants.

## Solution's description

Application was developed with solid pattern.
OOP approach was used when developing. 
That gives us scalability and simplicity for testing.

All function are sorted to two classes. 
Class Questionnaire store common function that sends user questions and takes and counts it's questions.
Class StoredData store functions for counting results of questionnaire and saving answers.

For storing data I created values iterator and store it in hash.
Hash is more preferable because of it speed.
Hash is suitable for storing values as keys and quantity as value.
