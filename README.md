# Feature Models

This repo contains model definitions that demonstrate features of ComposeDB.
With each model you can deploy it and then list existing documents for that model.
Additionally you can create new models that demonstrate new features.

>NOTE: All models in the repo are deployed to Testnet Clay and so many documents may already exist.
In order to experiment with the model you must run a local node connected to Clay.

## Using a Model

A model defines a common schema for all documents within the model.
Using the Ceramic network we can create new documents and read existing documents for a model.

### Deploy a Model

To be able to create or read documents for a model we must first deploy it to a local node.
This repo contains many different models, pick one from the composites directory and deploy it using the following command.

    composedb composite:deploy composites/hello_world.json

>NOTE: You must have an admin DID configured in your environment in order to deploy models to a local node.
See https://developers.ceramic.network/docs/composedb/set-up-your-environment#developer-account

### Creating a Document

Now we can create a new document within that model. We need to use the stream Id for the model and specify its content.
For the `Hello World` model this looks like:

    composedb document:create kjzl6hvfrbw6c5217gm158l4qvwet3h19pftloh07ier7sir9l55t9n7zvj9n0u '{"greeting":"hello world"}'

>NOTE: The stream Id for a model can be found in its composite file.
For example use jq to extract the stream Id: `jq -r '(.models | keys)[0]' composites/hello_world.json`.

### Listing Existing Documents

Finally we can list and paginate through existing documents for a model.
Again we need the stream Id for the model.

    composedb document:list kjzl6hvfrbw6c5217gm158l4qvwet3h19pftloh07ier7sir9l55t9n7zvj9n0u

## Create a Model

To create a new model add a graphQL Schema Definition into the `models` directory.
Name the output composite with the same name as the model file, renaming the extension from `.graphql` to `.json`.
Then create the model against a running js-ceramic node using this command.

    composedb composite:create model/hello_world.graphql --output composites/hello_world.json


## Makefile

We provide a Makefile that provides targets for creating composites from models and then deploying all models to a node.

    make composites/hello_world.json # Creates the model composite
    make deploy # Deploys all models to the node

## License

Fully open source and dual-licensed under MIT and Apache 2.
