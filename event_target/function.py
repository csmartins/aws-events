import json
import pymongo
import sys
import os
import logging

def get_events_database():
    database_user = os.environ['MONGO_USER']
    database_password = os.environ['MONGO_PASSWORD']
    database_endpoint = os.environ['MONGO_ENDPOINT']
    database_port = os.environ['MONGO_PORT']
    connection_string = 'mongodb://{}:{}@{}:{}/?ssl=true&ssl_ca_certs=rds-combined-ca-bundle.pem&replicaSet=rs0&readPreference=secondaryPreferred'.format(database_user,database_password,database_endpoint,database_port)

    mongo_con = pymongo.MongoClient(connection_string)
    database = mongo_con.events

    # returning only the database makes it easier to add different events to different collections
    return database

def event_handler(event, context):
    # logging.info("Connecting to database")
    print("Connecting to database")
    events_database = get_events_database()
    ec2_collection = events_database.ec2events

    # logging.info("Inserting event {} from {}".format(event['id'], event['source']))
    print("Inserting event {} from {}".format(event['id'], event['source']))
    ec2_collection.insert_one(event)
    
    return {
        'statusCode': 200
    }
