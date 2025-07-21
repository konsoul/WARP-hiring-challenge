FROM ubuntu:22.04

# Install necessary tools
RUN apt-get update && \
    apt-get install -y \
    gawk \
    bash \
    coreutils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the shell script and data files
COPY mars_mission_analyzer.sh .
COPY space_missions_clean.csv .

# Make the script executable
RUN chmod +x mars_mission_analyzer.sh

# Run the script
CMD ["./mars_mission_analyzer.sh"]