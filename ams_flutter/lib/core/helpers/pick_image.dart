import 'package:image_picker/image_picker.dart';

class ImagePickHelper {
  pickimage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      return await image.readAsBytes();
    }
    return ("No images selected");
  }
}