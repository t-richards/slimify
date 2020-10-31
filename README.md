# slimify

An Arch Linux package for automatically removing unnecessary junk from Arch Linux-based docker images.

## Getting started

Probably don't install this package on your local machine.

```bash
makepkg -s
```

Install the built package within your docker image build step.

:tada: That's it! You're done. Package installs will automatically slimify the image of unneeded files.

## License

MIT
