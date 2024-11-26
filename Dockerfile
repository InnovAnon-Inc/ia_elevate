FROM innovanon/ia_check_root AS check_root
FROM innovanon/ia_setup      AS setup

COPY --from=check_root /tmp/py/ /tmp/py/
RUN pip install --no-cache-dir --upgrade -r requirements.txt
RUN pip install --no-cache-dir --upgrade .
RUN rm -rf /tmp/py/

COPY ./ ./
RUN pip install --no-cache-dir --upgrade -r requirements.txt
RUN pip install --no-cache-dir --upgrade .
ENTRYPOINT ["python", "-m", "ia_elevate"]
