# Databases

## Cassandra

Distributed (NoSQL) database with strongest model.
Main version is Java, but ScyllaDB has a more performant version.

## CockroachDB

Fully distributed database (like Cassandra) but with true SQL semantics.
It almost looks like this could be a drop-in replacement for a Postgres server?

Seems like the main hiccups would be (A) some SQL incompatibilities (heard some rumors about JOINs being a problematic area)
and (B) potential performance degradation.

This seems like first-and-foremost a commercial product,
so I'm also not sure if it's feasible to run in a fashion outside of their product offerings.

## MariaDB Xpand

This seems like a pretty new addition to the MariaDB space that maybe just gives you distributed database for free?

## ScyllaDB

Cassandra, but better.

## Isar

Flutter DB. When I was working on the prayer app, the best DB I could find for
cross-platform (PWA + native app) was Hive.
Isar aimed to be a more powerful follow-on to Hive but was not production-ready at the time.

https://github.com/isar/isar
