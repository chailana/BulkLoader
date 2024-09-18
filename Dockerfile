FROM xgorn/python-phantomjs:3.9

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Install additional packages
RUN apt-get update && apt-get install -y ffmpeg supervisor

# Copy application files
COPY . /app

# Copy Supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Make start.sh executable
RUN chmod +x /app/start.sh

# Command to run the application
CMD ["/app/start.sh"]
