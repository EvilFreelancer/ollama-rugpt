# Загрузка ruGPT3 на ollama

Активируем окружение:

```shell
python -m venv venv
. venv/bin/activate
pip install -r requirements.txt
```

Скачаем все модели:

```shell
python3 get_models.py
```

Клонируем репозиторий `llama.cpp`, ставим пакеты из него:

```shell
git clone https://github.com/ggerganov/llama.cpp.git
cd llama.cpp
pip install -r requirements.txt 
```

Скомпилирует бинарь для квантизации

```shell
make llama-quantize llama-cli
```

Теперь поправим скрипт `llama.cpp/gguf-py/gguf/gguf_writer.py`, в нём нужно отключить защиту от дублирующихся названий слоёв:

```python
        # if any(name in tensors for tensors in self.tensors):
            # raise ValueError(f'Duplicated tensor name {name!r}')
```

После этого потребуется в скрипте `llama.cpp/convert_hf_to_gguf.py` для модели gpt2 отключить поддержку претокенизации,
для этого потребуется в функции `def _set_vocab_gpt2(self) -> None:` закомментировать строку:

```python
# self.gguf_writer.add_tokenizer_pre(tokpre)
```

Подробнее https://github.com/ollama/ollama/issues/4529#issuecomment-2121889276

Далее добавим модели в массив `models` в скрипте `llama.cpp/convert_hf_to_gguf_update.py`:

```python
models = [
    {"name": "rugpt3small_based_on_gpt2", "tokt": TOKENIZER_TYPE.BPE, "repo": "../rugpt3small_based_on_gpt2/orig"},
    {"name": "rugpt3medium_based_on_gpt2", "tokt": TOKENIZER_TYPE.BPE, "repo": "../rugpt3medium_based_on_gpt2/orig"},
    {"name": "rugpt3large_based_on_gpt2", "tokt": TOKENIZER_TYPE.BPE, "repo": "../rugpt3large_based_on_gpt2/orig"},
    {"name": "ruGPT-3.5-13B", "tokt": TOKENIZER_TYPE.BPE, "repo": "../ruGPT-3.5-13B"},
]
```

Обновляем список моделей

```shell
python3 convert_hf_to_gguf_update.py <huggingface_token>
```

Запускаем конвертацию моделей в GGUF fp16, а следом квантуем её до нужных уровней:

```shell
cat ../models.txt | grep -v '^#' | \
while read repo_id; do
    folder=$(echo $repo_id | awk -F\/ '{print $2}')
    python3 convert_hf_to_gguf.py --outtype=f16 --outfile="../$folder/model-fp16.gguf" "../$folder/orig"
    # ./llama-quantize "../$folder/model-fp16.gguf" "../$folder/model-q4_0.gguf" Q4_0
    # ./llama-quantize "../$folder/model-fp16.gguf" "../$folder/model-q5_0.gguf" Q5_0
    ./llama-quantize "../$folder/model-fp16.gguf" "../$folder/model-q8_0.gguf" Q8_0
done
```

> Занятный факт, `ollama` не позволяет работать с моделями квантованными ниже чем q8_0.  

Теперь создадим серию `Modelfile`'ов для импорта в `ollama`:

```shell
python3 ollama-gen.py
```

А тут занятный гист про количество параметров разных моделей:

https://gist.github.com/comaniac/bf4ac08be37afaa47d3506ac2377c9c7
