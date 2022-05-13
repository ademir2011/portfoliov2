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
  // final githubController = TextEditingController();
  // final playstoreController = TextEditingController();
  // final figmaController = TextEditingController();

  // PlatformFile? pickedfile;
  // FilePickerResult? filePickerResult;

  // void _selectFile() async {
  //   filePickerResult = await FilePicker.platform.pickFiles(type: FileType.video);
  //   setState(() {
  //     if (filePickerResult != null) pickedfile = filePickerResult!.files.first;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      titleController.text = widget.project.name ?? '';
      descriptionController.text = widget.project.description ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: DialogTemplateWidget(
        height: 550,
        width: 700,
        child: BlocBuilder(
          bloc: widget.projectBloc,
          builder: (ctx, state) {
            if (state is SuccessUpdateProjectState) {
              Modular.to.pushNamedAndRemoveUntil('/portfolio/project/${widget.project.id}', (_) => true);
            }
            return Form(
              key: widget.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CADASTRAR PROJETO',
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
                  // const SizedBox(height: 10),
                  // TextFormFieldWidget(
                  //   hintText: 'Github',
                  //   controller: githubController,
                  // ),
                  // const SizedBox(height: 10),
                  // TextFormFieldWidget(
                  //   hintText: 'Playstore',
                  //   controller: playstoreController,
                  // ),
                  // const SizedBox(height: 10),
                  // TextFormFieldWidget(
                  //   hintText: 'Figma',
                  //   controller: figmaController,
                  // ),
                  // const SizedBox(height: 10),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: OutlinedButtonWidget(
                  //     title: pickedfile != null ? pickedfile!.name : 'SELECIONAR ARQUIVO',
                  //     onPressed: _selectFile,
                  //   ),
                  // ),
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

                            widget.projectBloc.add(
                              UpdateProjectEvent(
                                project: widget.project,
                                filePickerResult: null,
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
