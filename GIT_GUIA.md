# 🔄 Guia Git + GitHub — Cola Rápida

> Este guia é sua referência para salvar seu progresso no GitHub.
> Volte aqui sempre que precisar!

---

## 🚀 Setup Inicial (só precisa fazer UMA VEZ)

### 1. Criar o repositório no GitHub

1. Abra https://github.com/new
2. Nome: `cs50-jornada` (ou o que preferir)
3. Deixe como **Private** (seu código, sua privacidade)
4. **NÃO** marque "Add a README" (já temos um)
5. Clique "Create repository"

### 2. Conectar seu projeto local ao GitHub

Depois de criar, o GitHub vai mostrar comandos. Use estes:

```powershell
# Conectar ao repositório remoto (troque SEU_USUARIO pelo seu username)
git remote add origin https://github.com/SEU_USUARIO/cs50-jornada.git

# Renomear branch para 'main' (padrão do GitHub)
git branch -M main

# Enviar tudo pela primeira vez
git push -u origin main
```

Pronto! Seu código está no GitHub. 🎉

---

## 📦 Salvar Progresso (faça SEMPRE que terminar de codar)

São apenas 3 comandos. Decore eles:

```powershell
# 1. Adicionar todas as mudanças
git add -A

# 2. Criar um "ponto de salvamento" com uma mensagem
git commit -m "descreva o que voce fez"

# 3. Enviar para o GitHub
git push
```

### Exemplos de mensagens boas:

```powershell
git commit -m "week1: funcao main com validacao de argumentos"
git commit -m "week1: geracao de senha funcionando, falta testar"
git commit -m "week1: todos os testes passando!"
git commit -m "week0: jogo de esquiva completo no scratch"
```

---

## 🔍 Comandos Úteis

```powershell
# Ver o que mudou desde o último commit
git status

# Ver o histórico de commits
git log --oneline

# Ver as diferenças no código
git diff
```

---

## 💡 Regra de Ouro

> **Commite cedo, commite sempre.**
>
> Fez algo funcionar? `git commit`
> Vai mudar de abordagem? `git commit` antes
> Terminou o dia? `git commit` + `git push`
>
> Pense no commit como CTRL+S, e no push como "backup na nuvem".

---

## 🆘 Problemas Comuns

### "Não consigo dar push, pede senha"
```powershell
# O GitHub não aceita mais senha. Use token:
# 1. Vá em: GitHub → Settings → Developer Settings → Personal Access Tokens → Tokens (classic)
# 2. Gere um token com permissão "repo"
# 3. Use o token como senha quando pedir
```

### "Fiz besteira e quero voltar"
```powershell
# Ver o que mudou
git diff

# Desfazer TODAS as mudanças (volta pro último commit)
git checkout .

# Desfazer só UM arquivo
git checkout -- nome_do_arquivo.c
```

### "Deu conflito"
Não se preocupe com isso agora. Você é o único trabalhando no repo.
Se acontecer, me chama!
