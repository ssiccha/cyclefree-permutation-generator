FROM gapsystem/gap-docker

COPY --chown=1000:1000 . $HOME/cyclefree-permutation-generator

USER gap

WORKDIR $HOME/cyclefree-permutation-generator/notebooks
