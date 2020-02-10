# The Unarchiver Container

Write the following settings in `.bashrc` .

```
alias unar='docker run -it --name=unar --rm -v ${PWD}:/root/share:z local/unar unar'
```

