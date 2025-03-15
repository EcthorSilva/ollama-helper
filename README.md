# ollama-helper

```
helsinki@Ecthors-MacBook-Pro ollama-helper % ls -l ollama-helper.sh
-rw-r--r--@ 1 helsinki  staff  320 15 Mar 14:33 ollama-helper.sh

helsinki@Ecthors-MacBook-Pro ollama-helper % chmod +x ollama-helper.sh

helsinki@Ecthors-MacBook-Pro ollama-helper % ls -l ollama-helper.sh
-rwxr-xr-x@ 1 helsinki  staff  320 15 Mar 14:33 ollama-helper.sh
```

adicionar no .zshrc

```
command_not_found_handler() {
    ~/Documents/projetos/ollama-helper/ollama-helper.sh "$1"
}
```