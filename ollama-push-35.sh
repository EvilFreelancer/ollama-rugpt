#!/bin/bash

set -xe

#
# CREATE
#

#ollama create -f ./ruGPT-3.5-13B/Modelfile.fp16 evilfreelancer/rugpt3.5:13b-fp16
#ollama create -f ./ruGPT-3.5-13B/Modelfile.q8_0 evilfreelancer/rugpt3.5:13b-q8_0
#ollama create -f ./ruGPT-3.5-13B/Modelfile.q5_0 evilfreelancer/rugpt3.5:13b-q5_0
#ollama create -f ./ruGPT-3.5-13B/Modelfile.q4_0 evilfreelancer/rugpt3.5:13b-q4_0
#ollama create -f ./ruGPT-3.5-13B/Modelfile.q4_0 evilfreelancer/rugpt3.5:13b
#ollama create -f ./ruGPT-3.5-13B/Modelfile.q4_0 evilfreelancer/rugpt3.5:latest

#
# PUSH
#

ollama push evilfreelancer/rugpt3.5:13b-q4_0
ollama push evilfreelancer/rugpt3.5:13b
ollama push evilfreelancer/rugpt3.5:latest
ollama push evilfreelancer/rugpt3.5:13b-q5_0
ollama push evilfreelancer/rugpt3.5:13b-q8_0
ollama push evilfreelancer/rugpt3.5:13b-fp16
