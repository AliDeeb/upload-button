# Upload button
Upload button is a flutter widget that presents a button with a progress drawn as an arc around it.


## Example
https://github.com/AliDeeb/upload-button/assets/47333501/df508453-c815-4488-ac94-945738947a0f

```
UploadButton(
      width: 180,
      height: 65,
      progressValue: 0.5,
      onTap: () {},
      color: const Color(0xFF0969E7),
      borderRadius: 100,
      strokeColor: const Color.fromARGB(120, 9, 105, 231),
      strokeWidth: 8,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 25),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_upward_rounded,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 10),
            Text("Upload", style: style),
          ],
        ),
      ),
    ),
```
- ```width``` - The width of the button.
- ```height``` - The height of the button.
- ```progressValue``` - Value of the progress between 0 and 1.
- ```onTap``` - Tap callback of button.
- ```color``` - The color of the button.
- ```borderRadius``` - The borderRadius of the button.
- ```strokeColor``` - The color of the progress around of button.
- ```strokeWidth``` - The width of the progress.
- ```child``` - The child of the button.

## Connect with me
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ali-deeb-62b1561a5)


## Built with
![flutter](https://github.com/AliDeeb/fancy-stepper/assets/47333501/c3895a2d-5975-495e-9af5-11bd37d70edc) ![dart](https://github.com/AliDeeb/fancy-stepper/assets/47333501/12682adf-fa0c-4924-bc8d-af3aa8d3df58)

## Contributions
All contributions are welcome!
