---
syntax: bash
tags: [database, postgresql]
---
# To install the PostgreSQL client tools with Homebrew on macOS or Linux:
brew install libpq

# To add the keg-only PostgreSQL client tools to PATH for the current shell:
export PATH="$(brew --prefix libpq)/bin:$PATH"

# To show help:
pg_dump --help
pg_restore --help
psql --help

# To list databases:
psql --list

# To show all server settings:
psql --command='SHOW ALL'

# To create a compressed custom-format backup:
pg_dump --host=<hostname> --port=<port> --username=<user> \
    --format=custom --large-objects --verbose \
    --file=<backup-path> <database>

# To inspect the contents of a custom-format backup:
pg_restore --list <backup-path>

# To restore a custom-format backup into an existing database:
pg_restore --host=<hostname> --port=<port> --username=<user> \
    --dbname=<database> --verbose --exit-on-error <backup-path>

# Common connection options:
# -h, --host=HOSTNAME       database server host or socket directory
# -p, --port=PORT           database server port number
# -U, --username=NAME       connect as the specified database user
# -W, --password            force a password prompt
# -d, --dbname=NAME         connect to this database

# Common backup and restore options:
# -F, --format=c|d|t|p      custom, directory, tar, or plain format (pg_dump)
# -f, --file=FILENAME       output file or directory
# -b, --large-objects       include large objects (pg_dump)
# -c, --clean               drop database objects before recreating them
# -C, --create              include/create the database itself
# -j, --jobs=NUM            run parallel jobs (directory dump or restore)
# -v, --verbose             verbose output
