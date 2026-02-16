#!/bin/bash

rsync -avz -e "ssh -i ~/.ssh/key_pair.pem" ./Static_site_server/ ubuntu@13.51.201.38:/var/www/mysite