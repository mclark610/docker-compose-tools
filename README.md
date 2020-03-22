These are my favorite tools for when I develop.  I usually run this by doing a 
$>sudo docker-compose up -d <container>
These are setup to use environment variable files on my linux box.  

mariadb:
    image: mariadb
    container_name: some-mariadb
    env_file:
    - ./.env_mariadb
    volumes:
    - /data/mysql:/var/lib/mysql
    - /data/raw:/data/raw
    ports:
    - 0.0.0.0:3306:3306

inside my ./env_mariadb file:
MYSQL_ROOT_PASSWORD=my-secret-pw

If I didnt want to deal with environment files, I would do it this way:
mariadb:
    image: mariadb
    container_name: some-mariadb
    environment:
    - "MYSQL_ROOT_PASSWORD=my-secret-pw"
    volumes:
    - /data/mysql:/var/lib/mysql
    - /data/raw:/data/raw
    ports:
    - 0.0.0.0:3306:3306

volumes:
  I have a directory in my root named /data
  I place all my databases here I develop including a directory all containers have common access to.  This is for easily running command line importing and exporting tools.
  The data directory structure:
  /data
  /data/raw : sql files for importing into any database
  /data/mysql, /data/postgres, etc (I do not mess with these directories - just daily/weekly backups)


Added microsoft sql server to the mix

