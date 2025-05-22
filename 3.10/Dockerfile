FROM ghcr.io/astral-sh/uv:0.7.7 AS uv

FROM python:3.10.17
COPY --from=uv /uv /uvx /bin/
