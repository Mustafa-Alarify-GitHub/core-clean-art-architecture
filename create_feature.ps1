# .\create_feature.ps1 -FeatureName orders
param (
    [Parameter(Mandatory = $true)]
    [string]$FeatureName
)

$featureLower = $FeatureName.ToLower()

$culture = (Get-Culture).TextInfo
$featurePascal = $culture.ToTitleCase($featureLower)

$basePath = "lib\features\$featureLower"

$folders = @(
    "$basePath\data\datasources",
    "$basePath\data\models",
    "$basePath\data\repositories",
    "$basePath\domain\entities",
    "$basePath\domain\repositories",
    "$basePath\domain\usecases",
    "$basePath\presentation\pages",
    "$basePath\presentation\providers",
    "$basePath\presentation\widgets"
)

Write-Host "🚀 Creating feature: $featurePascal" -ForegroundColor Cyan

foreach ($folder in $folders) {
    if (!(Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder | Out-Null
        Write-Host "✅ Created $folder" -ForegroundColor Green
    }
}

# ---------------- FILES ----------------

# Data: Remote Data Source
$datasourceContent = @"
import '../../domain/entities/${featureLower}_entity.dart';

abstract class ${featurePascal}RemoteDataSource {
  Future<List<${featurePascal}Entity>> get${featurePascal}();
}

class ${featurePascal}RemoteDataSourceImpl implements ${featurePascal}RemoteDataSource {
  ${featurePascal}RemoteDataSourceImpl();

  @override
  Future<List<${featurePascal}Entity>> get${featurePascal}() async {
    // TODO: Implement API call here
    throw UnimplementedError();
  }
}
"@
Set-Content "$basePath\data\datasources\${featureLower}_remote_datasource.dart" $datasourceContent

# Data: Model
$modelContent = @"
import '../../domain/entities/${featureLower}_entity.dart';

class ${featurePascal}Model extends ${featurePascal}Entity {
  ${featurePascal}Model({
    required super.id,
    required super.title,
    required super.status,
  });

  factory ${featurePascal}Model.fromJson(Map<String, dynamic> json) {
    return ${featurePascal}Model(
      id: json['id'] as int,
      title: json['title'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'status': status,
  };
}
"@
Set-Content "$basePath\data\models\${featureLower}_model.dart" $modelContent

# Data: Repository Implementation
$repositoryImplContent = @"
import '../../domain/entities/${featureLower}_entity.dart';
import '../../domain/repositories/${featureLower}_repository.dart';
import '../datasources/${featureLower}_remote_datasource.dart';

class ${featurePascal}RepositoryImpl implements ${featurePascal}Repository {
  final ${featurePascal}RemoteDataSource remoteDataSource;

  ${featurePascal}RepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<${featurePascal}Entity>> get${featurePascal}() async {
    return await remoteDataSource.get${featurePascal}();
  }
}
"@
Set-Content "$basePath\data\repositories\${featureLower}_repository_impl.dart" $repositoryImplContent

# Domain: Entity
$entityContent = @"
class ${featurePascal}Entity {
  final int id;
  final String title;
  final String status;

  ${featurePascal}Entity({
    required this.id,
    required this.title,
    required this.status,
  });
}
"@
Set-Content "$basePath\domain\entities\${featureLower}_entity.dart" $entityContent

# Domain: Repository Interface
$repositoryContent = @"
import '../entities/${featureLower}_entity.dart';

abstract class ${featurePascal}Repository {
  Future<List<${featurePascal}Entity>> get${featurePascal}();
}
"@
Set-Content "$basePath\domain\repositories\${featureLower}_repository.dart" $repositoryContent

# Domain: UseCase
$usecaseContent = @"
import '../repositories/${featureLower}_repository.dart';
import '../entities/${featureLower}_entity.dart';

class Get${featurePascal}UseCase {
  final ${featurePascal}Repository repository;

  Get${featurePascal}UseCase({required this.repository});

  Future<List<${featurePascal}Entity>> call() async {
    return await repository.get${featurePascal}();
  }
}
"@
Set-Content "$basePath\domain\usecases\get_${featureLower}_usecase.dart" $usecaseContent

# Presentation: Providers (Dependencies)
$providerContent = @"
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/${featureLower}_remote_datasource.dart';
import '../../data/repositories/${featureLower}_repository_impl.dart';
import '../../domain/repositories/${featureLower}_repository.dart';
import '../../domain/usecases/get_${featureLower}_usecase.dart';

// 1. Data Source Provider
final ${featureLower}RemoteDataSourceProvider = Provider<${featurePascal}RemoteDataSource>((ref) {
  return ${featurePascal}RemoteDataSourceImpl();
});

// 2. Repository Provider
final ${featureLower}RepositoryProvider = Provider<${featurePascal}Repository>((ref) {
  final remoteDataSource = ref.read(${featureLower}RemoteDataSourceProvider);
  return ${featurePascal}RepositoryImpl(remoteDataSource: remoteDataSource);
});

// 3. UseCase Provider
final get${featurePascal}UseCaseProvider = Provider<Get${featurePascal}UseCase>((ref) {
  final repository = ref.read(${featureLower}RepositoryProvider);
  return Get${featurePascal}UseCase(repository: repository);
});

// 4. UI Future Provider
final ${featureLower}ListProvider = FutureProvider((ref) async {
  final useCase = ref.read(get${featurePascal}UseCaseProvider);
  return await useCase();
});
"@
Set-Content "$basePath\presentation\providers\${featureLower}_provider.dart" $providerContent

# Presentation: Widget
$widgetContent = @"
import 'package:flutter/material.dart';
import '../../domain/entities/${featureLower}_entity.dart';

class ${featurePascal}Widget extends StatelessWidget {
  final List<${featurePascal}Entity> items;

  const ${featurePascal}Widget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item.title),
          subtitle: Text(item.status),
        );
      },
    );
  }
}
"@
Set-Content "$basePath\presentation\widgets\${featureLower}_widget.dart" $widgetContent

# Presentation: Page
$pageContent = @"
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/${featureLower}_provider.dart';
import '../widgets/${featureLower}_widget.dart';

class ${featurePascal}Page extends ConsumerWidget {
  const ${featurePascal}Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ${featureLower}Async = ref.watch(${featureLower}ListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('$featurePascal')),
      body: ${featureLower}Async.when(
        data: (items) => ${featurePascal}Widget(items: items),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
"@
Set-Content "$basePath\presentation\pages\${featureLower}_page.dart" $pageContent

Write-Host "📄 Dart files with template content created successfully" -ForegroundColor Cyan
Write-Host "🎉 Feature '$featurePascal' is READY!" -ForegroundColor Yellow