FROM nginx:alpine

# Remove default nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy your project files into nginx folder
COPY . /usr/share/nginx/html

# Expose port
EXPOSE 80
