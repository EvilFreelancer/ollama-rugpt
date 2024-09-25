temperature = 1
num_ctx = 2048
quantizations = ["q4_0", "q5_0", "q8_0", "fp16"]


def create_modelfile(model_name, quantization):
    model_short_name = model.split('/')[-1]
    modelfile_name = f"{model_short_name}/Modelfile.{quantization}"

    print(f"Creating \"{modelfile_name}\" for \"{model_name}\" with quantization \"{quantization}\"")

    with open(modelfile_name, 'w') as f:
        f.write(f"FROM ./model-{quantization}.gguf\n")
        f.write(f"PARAMETER temperature {temperature}\n")
        f.write(f"PARAMETER num_ctx {num_ctx}\n")


with open('models.txt', 'r') as file:
    models = [line.strip() for line in file if not line.startswith('#')]

for model in models:
    for quantization in quantizations:
        create_modelfile(model, quantization)
