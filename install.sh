#!/bin/bash

sfctl application upload --path FabricClusterCsharpApp --show-progress
sfctl application provision --application-type-build-path FabricClusterCsharpApp
sfctl application create --app-name fabric:/FabricClusterCsharpApp --app-type FabricClusterCsharpAppType --app-version 1.0.0
