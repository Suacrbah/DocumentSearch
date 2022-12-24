## Meilisearch Search

In this directory, you will find the front-end interface to search through all Nobel Prize winners and their details.
The search is powered by [Meilisearch](https://github.com/meilisearch/meilisearch), a powerful, fast and open-source search engine easy to use and deploy.

## Demo

_Based on [How to Search Nobel Prize Winners Faster With Meilisearch and JavaScript](https://blog.meilisearch.com/how-to-search-nobel-prize-winners-faster-with-meilisearch-api-for-javascript/)._

## Clone the repo using the following command:

```bash
$ git clone https://github.com/Suacrbah/DocumentSearch.git
$ cd DocumentSearch
```

## Data import

If you want to replicate this demo using your own Meilisearch instance, you will have to follow these steps:

### 1. Download and launch Meilisearch in docker

```bash
$ make meili
```

### 2. Run the setup

Go inside the `setup` directory and run the following commands:
```bash
$ make data
```

This will do the following:
- Create an index called `books` in the Meilisearch instance.
- Add all Nobel prizes documents to that index.
- Add custom settings for a more relevant search.

### 3. Change the credentials in the front-end client

The credentials of the Meilisearch instance are written inside `src/meilisearch-client.js`. By default, these are the public credentials for the Nobel dataset.

You have to change these credentials with your local instance:

```javascript
const MEILISEARCH_HOST = "http://127.0.0.1:7700"
const MEILISEARCH_API_KEY = ""

export {
  MEILISEARCH_HOST,
  MEILISEARCH_API_KEY
}
```

Because we did not set any API key at [step 1](#1-download-and-launch-meilisearch), we don't need to provide any `MEILISEARCH_API_KEY` here.

## Run the project

Firstly, you will need to install [yarn](https://classic.yarnpkg.com/en/docs/install/).</br>

Navigate to the repo and open two terminals.

In the first terminal, start meilisearch server:

```bash
$ make meili
```

In the second terminal, start Vue frontend:

```bash
$ yarn
$ yarn serve
```

You can now visit `http://localhost:8080/` in your browser.

We've included some credentials in the code, allowing you to test the demo without having to create your own Meilisearch instance.


You can now visit `http://localhost:8080/` in your browser.

## Working example

💡 If you have never used InstantSearch, we recommend reading this [getting started documentation](https://www.algolia.com/doc/guides/building-search-ui/what-is-instantsearch/js/).
