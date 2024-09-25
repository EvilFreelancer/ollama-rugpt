#!/bin/bash

set -xe

#
# CREATE
#

# small (125m)

ollama create -f ./rugpt3small_based_on_gpt2/Modelfile.fp16 evilfreelancer/rugpt3:small-fp16
ollama create -f ./rugpt3small_based_on_gpt2/Modelfile.q8_0 evilfreelancer/rugpt3:small-q8_0
ollama create -f ./rugpt3small_based_on_gpt2/Modelfile.q8_0 evilfreelancer/rugpt3:small

ollama create -f ./rugpt3small_based_on_gpt2/Modelfile.fp16 evilfreelancer/rugpt3:125m-fp16
ollama create -f ./rugpt3small_based_on_gpt2/Modelfile.q8_0 evilfreelancer/rugpt3:125m-q8_0
ollama create -f ./rugpt3small_based_on_gpt2/Modelfile.q8_0 evilfreelancer/rugpt3:125m

# medium (356m)

ollama create -f ./rugpt3medium_based_on_gpt2/Modelfile.fp16 evilfreelancer/rugpt3:medium-fp16
ollama create -f ./rugpt3medium_based_on_gpt2/Modelfile.q8_0 evilfreelancer/rugpt3:medium-q8_0
ollama create -f ./rugpt3medium_based_on_gpt2/Modelfile.q8_0 evilfreelancer/rugpt3:medium

ollama create -f ./rugpt3medium_based_on_gpt2/Modelfile.fp16 evilfreelancer/rugpt3:356m-fp16
ollama create -f ./rugpt3medium_based_on_gpt2/Modelfile.q8_0 evilfreelancer/rugpt3:356m-q8_0
ollama create -f ./rugpt3medium_based_on_gpt2/Modelfile.q8_0 evilfreelancer/rugpt3:356m

# large (760m)

ollama create -f ./rugpt3large_based_on_gpt2/Modelfile.fp16 evilfreelancer/rugpt3:large-fp16
ollama create -f ./rugpt3large_based_on_gpt2/Modelfile.q8_0 evilfreelancer/rugpt3:large-q8_0
ollama create -f ./rugpt3large_based_on_gpt2/Modelfile.q8_0 evilfreelancer/rugpt3:large

ollama create -f ./rugpt3large_based_on_gpt2/Modelfile.fp16 evilfreelancer/rugpt3:760m-fp16
ollama create -f ./rugpt3large_based_on_gpt2/Modelfile.q8_0 evilfreelancer/rugpt3:760m-q8_0
ollama create -f ./rugpt3large_based_on_gpt2/Modelfile.q8_0 evilfreelancer/rugpt3:760m

# latest is large q8_0

ollama create -f ./rugpt3large_based_on_gpt2/Modelfile.q8_0 evilfreelancer/rugpt3:latest

#
# PUSH
#

# small (125m)

ollama push evilfreelancer/rugpt3:small-fp16
ollama push evilfreelancer/rugpt3:small-q8_0
ollama push evilfreelancer/rugpt3:small

ollama push evilfreelancer/rugpt3:125m-fp16
ollama push evilfreelancer/rugpt3:125m-q8_0
ollama push evilfreelancer/rugpt3:125m

# medium (356m)

ollama push evilfreelancer/rugpt3:medium-fp16
ollama push evilfreelancer/rugpt3:medium-q8_0
ollama push evilfreelancer/rugpt3:medium

ollama push evilfreelancer/rugpt3:356m-fp16
ollama push evilfreelancer/rugpt3:356m-q8_0
ollama push evilfreelancer/rugpt3:356m

# large (760m)

ollama push evilfreelancer/rugpt3:large-fp16
ollama push evilfreelancer/rugpt3:large-q8_0
ollama push evilfreelancer/rugpt3:large

ollama push evilfreelancer/rugpt3:760m-fp16
ollama push evilfreelancer/rugpt3:760m-q8_0
ollama push evilfreelancer/rugpt3:760m

# latest is large q8_0

ollama push evilfreelancer/rugpt3:latest
