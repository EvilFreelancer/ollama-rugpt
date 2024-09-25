import os
from transformers import AutoModelForCausalLM, AutoTokenizer


def download_model(model_name):
    model_short_name = model_name.split('/')[-1]
    output = f"./{model_short_name}/orig"

    print(f"Downloading model \"{model_name}\" to \"{output}\" folder")

    model = AutoModelForCausalLM.from_pretrained(model_name)
    tokenizer = AutoTokenizer.from_pretrained(model_name)

    os.makedirs(output, exist_ok=True)
    model.save_pretrained(output)
    tokenizer.save_pretrained(output)


with open('models.txt', 'r') as file:
    models = [line.strip() for line in file if not line.startswith('#')]

for model in models:
    download_model(model)
