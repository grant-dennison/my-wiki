# Backup System

During my vacation to Kentucky, I became a bit obsessed with the idea
of implementing some personal data backup solution.

Some rationale:
* I might forget passwords
* I could die
* My computer(s) could die

Ideal design:
* Select directories on primary computer two-way sync with cloud/backup
* Backup exists both in the cloud and on local external hard-drive
* Backup format is git
* Git backup is browsable via web interface (a la GitHub/GitLab)
* Arbitrary segmentation
* (maybe) some level of encryption?

## Off-the-Shelf Tools

I have not found anything off-the-shelf that works as I want.

I considered [Proton Drive](https://proton.me/drive) for the basic file-syncing part,
but it is still pretty young, doesn't have native file system integration,
and definitely doesn't have Linux support yet.

## Syncing Tools

* `rsync` is a standard tool that might make a good backbone for syncing
  * only one-way syncing
  * a little tricky to get installed on Windows on top of Git Bash
* [rclone](https://rclone.org) has a lot more features than rsync
  * young, nonstandard tool
  * supports S3 + encryption natively

## Current Design Vision

* Three systems: personal machine, cloud server, and raspberry pi
* One docker compose code base with three different profiles for the three systems.

### Personal Machine

On my computer, I would run a docker compose profile that would basically just
rclone configured (in compose.yml) directories to/from the cloud server on some interval.

### Cloud Server

On cloud server, mount S3 storage and run a different docker compose profile.

* Daily commit files
* Serve git repository in web interface

### Raspberry Pi

On raspberry pi, mount external hard drive and run a third profile.

* Interval rclone files to/from server
* Interval pull git repository from server

## Sharing System

For source code, my current vision of sharing is to distribute a template of all my docker compose harness source.
I do not intend to ship any of the logic as a black box in any major distribution platform.
This model ensures high transparency into the backup process.

For sharing S3/server, I think I can have multiple destinations on the server for syncing.
If using rsync, I could expose multiple containers (per user) on different ports for SSH.
With rclone, I may be able to use different S3 keys, but I don't know
the S3 API well enough (mostly done Azure SAS at this point) to be sure.
