FROM ghcr.io/astral-sh/uv:0.13.3 AS uv

FROM python:3.10.22
COPY --from=uv /uv /uvx /bin/
