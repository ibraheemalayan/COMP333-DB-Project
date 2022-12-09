

if [[ $* == *--rebuild* ]]
then

    printf "\n\n> Building new db image ...\n\n"

    cd containers/db

    docker build . -t comp333_db_img

    printf "\n\n> Building new backend image ...\n\n"

    cd ../backend

    docker build . -t comp333_backend_img

    cd ../..

fi


# FIXME


# printf "\n\n> Killing previouse solr daemons ...\n\n"

# docker kill solr_silal
# docker container rm solr_silal
# docker run -d -p 8983:8983 --name solr_silal solr_silal_img
# # docker run -p 8983:8983 --name solr_silal solr_silal_img

# if [[ $* == *--rebuild* ]]
# then

#     printf "\n\n> Building new redis image ...\n\n"


#     cd containers/redis
#     docker build . -t silal_redis_img

#     cd ../..

# fi

# printf "\n\n> Killing previouse redis daemons ...\n\n"

# docker kill redis_silal
# docker container rm redis_silal
# docker run -d -p 8105:8105 --name redis_silal silal_redis_img


# printf "\n\n> Dropping database and running migrations ...\n\n"

# cd src

# flask cli drop-db
# flask db upgrade
# flask cli db-fill


# printf "\n\n> Starting local server ...\n\n"
# printf "\n\n> You can run tests and mock data using the following command in a different shell: \n\n"

# printf "\n\n python3 mock.py && pytest -rA api_clients/unit_tests \n\n"

# flask run
