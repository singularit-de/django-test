FROM ghcr.io/astral-sh/uv:0.6.12 AS uv

FROM python:3.10.16
COPY --from=uv /uv /uvx /bin/
