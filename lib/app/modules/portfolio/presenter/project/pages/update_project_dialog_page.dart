import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/portfolio.dart';
import 'package:portfoliov2/app/modules/portfolio/domain/entities/project.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_bloc.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_event.dart';
import 'package:portfoliov2/app/modules/portfolio/presenter/project/bloc/project_state.dart';
import 'package:portfoliov2/shared/widgets/dialog_template_widget.dart';
import 'package:portfoliov2/shared/widgets/outlined_button_widget.dart';
import 'package:portfoliov2/shared/widgets/textformfield_widget.dart';

class UpdateProjectDialogPage extends StatefulWidget {
  final projectBloc = Modular.get<ProjectBloc>();
  final formKey = GlobalKey<FormState>();
  final Project project;

  UpdateProjectDialogPage({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<UpdateProjectDialogPage> createState() => _UpdateProjectDialogPageState();
}

class _UpdateProjectDialogPageState extends State<UpdateProjectDialogPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final githubController = TextEditingController();
  final playstoreController = TextEditingController();
  final figmaController = TextEditingController();

  PlatformFile? pickedfileImage;
  PlatformFile? pickedfileVideo;
  FilePickerResult? filePickerResultImage;
  FilePickerResult? filePickerResultVideo;

  void _selectFileImage() async {
    filePickerResultImage = await FilePicker.platform.pickFiles(type: FileType.image);
    setState(() {
      if (filePickerResultImage != null) pickedfileImage = filePickerResultImage!.files.first;
    });
  }

  void _selectFileVideo() async {
    filePickerResultVideo = await FilePicker.platform.pickFiles(type: FileType.video);
    setState(() {
      if (filePickerResultVideo != null) pickedfileVideo = filePickerResultVideo!.files.first;
    });
  }

  String searchInArray(List<String> list, String key) {
    if (list.isEmpty) return '';
    return list.firstWhere((element) => element.contains(key), orElse: () => '');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      titleController.text = widget.project.name ?? '';
      descriptionController.text = widget.project.description ?? '';
      githubController.text = searchInArray(widget.project.socialNetwoksUrl ?? [], 'github');
      playstoreController.text = searchInArray(widget.project.socialNetwoksUrl ?? [], 'playstore');
      figmaController.text = searchInArray(widget.project.socialNetwoksUrl ?? [], 'figma');
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: DialogTemplateWidget(
        height: 700,
        width: 700,
        child: BlocBuilder(
          bloc: widget.projectBloc,
          builder: (ctx, state) {
            if (state is SuccessUpdateProjectState) {
              Modular.to.pop();
              Modular.to.pushNamed('/portfolio/project/${widget.project.id}');
            }

            return Form(
              key: widget.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ATUALIZAR PROJETO',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  TextFormFieldWidget(
                    hintText: 'Nome do projeto',
                    controller: titleController,
                  ),
                  const SizedBox(height: 10),
                  TextFormFieldWidget(
                    hintText: 'Descrição do projeto',
                    controller: descriptionController,
                    textArea: true,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: TextFormFieldWidget(
                          hintText: 'Github',
                          controller: githubController,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        child: TextFormFieldWidget(
                          hintText: 'Playstore',
                          controller: playstoreController,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        flex: 1,
                        child: TextFormFieldWidget(
                          hintText: 'Figma',
                          controller: figmaController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Thumbnail',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      OutlinedButtonWidget(
                        title: pickedfileImage != null ? pickedfileImage!.name : 'SELECIONAR IMAGE',
                        onPressed: _selectFileImage,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Vídeo',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      OutlinedButtonWidget(
                        title: pickedfileVideo != null ? pickedfileVideo!.name : 'SELECIONAR VÍDEO',
                        onPressed: _selectFileVideo,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    (state is ErrorProjectState) ? state.message : '',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).errorColor,
                        ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButtonWidget(
                        title: 'VOLTAR',
                        onPressed: () => Modular.to.pop(),
                        secondary: true,
                      ),
                      OutlinedButtonWidget(
                        title: 'ATUALIZAR',
                        isLoading: (state is LoadingProjectState),
                        onPressed: () {
                          if (widget.formKey.currentState!.validate()) {
                            widget.project.name = titleController.text;
                            widget.project.description = descriptionController.text;
                            widget.project.socialNetwoksUrl = <String>[
                              githubController.text,
                              playstoreController.text,
                              figmaController.text,
                            ];
                            widget.project.urlVideo =
                                pickedfileVideo != null ? pickedfileVideo!.name : widget.project.urlVideo;
                            widget.project.urlThumbnail =
                                pickedfileImage != null ? pickedfileImage!.name : widget.project.urlThumbnail;
                            widget.projectBloc.add(
                              UpdateProjectEvent(
                                project: widget.project,
                                filePickerResultImage: filePickerResultImage,
                                filePickerResultVideo: filePickerResultVideo,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      contentPadding: const EdgeInsets.all(0),
    );
  }
}
