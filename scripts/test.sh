#!/bin/bash

export GOPATH=~/hcsc-cob-sdk/src/gopath:~/hcsc-cob-sdk/src/sandbox/solution-template/server/
go test --tags nopkcs11

