#!/usr/bin/env python3
#Import functions
from __future__ import print_function
import json

#Search key in json data
def search_value(id, json_data):
    output = []

    def decode_dict(dict):
        try:
            output.append(dict[id])
        except KeyError:
            pass
        return dict

    json.loads(json_data, object_hook=decode_dict)
    return output

#Read JSON data from file
with open('./ec2_meta_data.json', 'r') as file:
    json_data = file.read() #Read JSON output from file

#Read Input
Key = input("Enter the key: ")
print(search_value(Key, json_data))