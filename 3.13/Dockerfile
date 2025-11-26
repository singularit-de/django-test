FROM ghcr.io/astral-sh/uv:0.9.13 AS uv

FROM python:3.13.9
COPY --from=uv /uv /uvx /bin/
