FROM zmkfirmware/zmk-build-arm:2.5

WORKDIR /root
COPY west.yml config/west.yml

RUN west init --local config
RUN west update
RUN west zephyr-export

COPY scripts/* scripts/
RUN chmod +x scripts/*

# # nice!60
# COPY boards/nice60/nice60* config/

# # Polarity Works BT60
# COPY boards/bt60 config/boards/arm/bt60

# # ErgoTravel
# COPY boards/ergotravel config/boards/shields/ergotravel

# the_paintbrush
COPY boards/the_paintbrush/the_paintbrush* config/

CMD ./scripts/build_${BOARD}
