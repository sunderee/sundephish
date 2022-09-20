# SundePhish Backend

Nest.js-based backend for SundePhish.

## Usage

The database of choice is MongoDB. I don't care where you host it, either on MongoDB Atlas, locally, in some Docker container... In any case, create a `.env` file with the following contents:

```bash
MONGO_URL="XXX"
XAUTH="XXX"
```

Treat `XAUTH` as your password.

Next, install dependencies, and you can run the app

```bash
# Install dependencies
npm install

# Option 1: run on bare-metal
npm run build
npm run start

# Option 2: use Docker
bash docker.sh
```

## License

Project is open-sourced under the MIT license.
