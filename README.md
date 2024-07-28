# ec2-lamp-buildkite-plugin
(Under Development, It is not the final version)

## Example

Add the following to your `pipeline.yml`:

```chmod 400 hooks/key.pem

# SSH anahtarının yolunu belirleyin
SSH_KEY_PATH="hooks/key.pem"
```

## Configuration

pipeline.yaml must be configured as you want such as IP and username and also please change key file when you want to use 

## Developing

To run the tests:

1.Hook files should be worked on in the pipeline section
2.Improvements can be made in the Hook folder

## Contributing

1. Fork the repo
2. Make the changes
3. Run the tests
4. Commit and push your changes
5. Send a pull request
