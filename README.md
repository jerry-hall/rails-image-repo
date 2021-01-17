# rails-image-rekognition-repo
**Author**: Jerry Hall    
**Created on**: January 16, 2021  
**Created for**: Summer 2021 - Shopify Developer Intern Challenge

Simple image repository supporting image recognition search functionality. Images are searchable by keywords and by image recognition powered by AWS Rekognition. 

## How this works?
**Image Uploads**:
The application supports drag-and-drop image uploads. 

**Search**:
It also supports searching by name, description, and tags.

<img src="readme-assets/image-upload-search.gif" width="50%" />

**Image Recognition with AWS Rekognition**:
Checking the box `Analyze with AWS Rekognition?` will use AWS Rekognition to generate a list of searchable tags. You must configure `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` in your environment variables.

**Update and Delete**:
You can edit and delete images that have been uploaded.

## Trade-offs
The following trade-offs were made for speed-of-delivery:
- No front-end styling or framework was used
- File are currently stored as ActiveStorage blobs
- AWS Rekognition requires images stored in base64
- Application is currently running in development environment
- No multi-image uploads (for the purposes of allowing tags)

## Other Considerations
This project was hacked together in a day (plus a little more). I ran into some fatal configuration issues when attempting to set up a Rails 6 environment. In order to move fast, I decided to scrap the project to that point and roll back to Rails 5, an environment already set up on my computer.

Had I more time, I would have certainly invested the effort to start this project with the latest version of Rails, as this would likely save me effort in maintainability later on down the road.

I opted to use Rails as it is the primary backend used at Shopify. 
## Future Improvements
- Implement styling (Bootstrap, MaterialUI, etc.)
- Connect ActiveStorage to cloud storage (S3 or GCP)
- Complete AWS Rekognition implementation by using `active-storage-base64` gem 
- Containerize Rails application
- Refactor code to implement multi-image uploads
## Gems Used
- `active_storage_drag_and_drop`
- `aws-sdk-rekognition`