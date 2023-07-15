import 'package:basic_task_mail/domain/model/domains.dart';

abstract class DomainRepository{
  Future<List<Domains>>generateDomain();
}