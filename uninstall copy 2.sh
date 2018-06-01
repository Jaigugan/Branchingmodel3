#!/bin/bash

sfctl application delete --application-id FabricClusterCsharpApp
sfctl application unprovision --application-type-name FabricClusterCsharpAppType --application-type-version 1.0.0
sfctl store delete --content-path FabricClusterCsharpApp