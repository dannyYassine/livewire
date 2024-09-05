# livewire

## install project

```bash
make install.env
```

## running the project

```bash
make up
```

## stoping the project

```bash
make down
```

## reset the project

```bash
make reset.env
```

On GCP to allow on GCP username

```
sudo passwd $username
```

```
echo "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$username
```