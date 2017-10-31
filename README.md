# gct

A really dumb git wrapper that allows git lazy commits.

## Purpose

I find myself running ``` git add . && git ct -m "message" && git push origin master ``` all the time and I wanted
to simply write a commit message and have the script do the rest.

## Installation

Pull down the repo and run ``` ./install.sh ```

## Usage

After any changes are done to a git repository simply run ``` gct "commit message here" ``` and everything
else should be done for you. This will add all changes, commit with your message, and right now it assumes
you are pushing to the current branch to remote ``` origin ```. In other words if you're on a branch called
``` foo ``` the last command will be ``` git push origin foo ``` after commiting.
