``` 
$ ansible-playbook site.yml -i hosts
```

```
$ ansible-playbook site.yml -i hosts -e "enviroment.http_proxy=$HTTP_PROXY environment.https_proxy=$HTTPS_PROXY"
```
