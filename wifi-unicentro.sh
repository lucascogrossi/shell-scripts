#!/bin/bash

sudo systemctl start NetworkManager
sudo nmcli con up "academicosUnicentro"

