# Rclone

Website: https://rclone.org/

I found Rclone while thinking through using `rsync` for [my backup solution](../projects/backup-system/index.md).
Two of the particular advantages it adds are (1) first-class **S3 support**
and (2) **encryption**.

* Available [as docker container](https://hub.docker.com/r/rclone/rclone)
* Also easy enough to [install](https://rclone.org/install/) (single Go binary?)
* Linux and Windows
* [Seems like](https://rclone.org/bisync/) it can handle two-way syncing _with deletes_ (though I'm not sure how they can manage that)
