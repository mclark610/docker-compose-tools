These are my favorite tools for when I develop.  I usually run this by doing a 
$>sudo docker-compose up
and then from portainer (not listed yet), I stop the containers I dont need right now. Ocasionally, I'll just do a docker-compose up mariadb or whatever tool I need to use.
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

